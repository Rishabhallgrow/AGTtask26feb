codeunit 70105 MySalesPostSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    procedure ReportAfterSalesPost(var SalesHeader: Record "Sales Header")
    var
        PostedSalesInvHeader: Record "Sales Invoice Header";
    begin

        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            // Find the posted invoice related to this Sales Order
            PostedSalesInvHeader.Reset();
            PostedSalesInvHeader.SetRange("Order No.", SalesHeader."No.");
            if PostedSalesInvHeader.FindFirst() then begin
                // Run the "Standard Sales - Invoice" report (Report 1306)
                Report.Run(Report::"Standard Sales - Invoice", true, false, PostedSalesInvHeader);
            end;
        end;
    end;
}