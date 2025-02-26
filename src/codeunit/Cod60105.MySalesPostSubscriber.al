codeunit 70105 MySalesPostSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    procedure ReportAfterSalesPost(var SalesHeader: Record "Sales Header")
    var
        PostedSalesInvHeader: Record "Sales Invoice Header";
    begin

        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            PostedSalesInvHeader.Reset();
            PostedSalesInvHeader.SetRange("Order No.", SalesHeader."No.");
            if PostedSalesInvHeader.FindFirst() then begin
                Report.Run(Report::"Standard Sales - Invoice", true, false, PostedSalesInvHeader);
            end;
        end;
    end;
}
