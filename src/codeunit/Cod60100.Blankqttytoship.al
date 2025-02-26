codeunit 70100 "Blankqttytoship"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure makeittoblank(var Rec: Record "Sales Line")
    begin
        Rec.Validate("Qty. to Ship", 0);
    end;
}