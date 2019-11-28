codeunit 50100 "Master Data Edit Lib"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeInsertEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeInsertCustomer(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(0); // Insert
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeModifyEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeModifyCustomer(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(1); // Modify
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeDeleteCustomer(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(2); // Delete
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnBeforeRenameEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeRenameCustomer(var Rec: Record Customer; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(3); // Rename
    end;


    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnBeforeInsertEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeInsertVendor(var Rec: Record Vendor; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(0); // Insert
    end;    
    
    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnBeforeModifyEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeModifyVendor(var Rec: Record Vendor; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(1); // Modify
    end;    
    

    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeDeleteVendor(var Rec: Record Vendor; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(2); // Delete
    end;    

    [EventSubscriber(ObjectType::Table, Database::Vendor, 'OnBeforeRenameEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeRenameVendor(var Rec: Record Vendor; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(3); // Rename
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeInsertEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeInsertItem(var Rec: Record Item; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(0); // Insert
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeModifyEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeModifyItem(var Rec: Record Item; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(1); // Modify
    end;
    
    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeDeleteItem(var Rec: Record Item; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(2); // Delete
    end;

    [EventSubscriber(ObjectType::Table, Database::Item, 'OnBeforeRenameEvent', '', true, true)]
    local procedure MasterDataEditOnBeforeRenameItem(var Rec: Record Item; RunTrigger: Boolean)
    begin
        CheckMasterDataEditAllowance(3); // Rename
    end;    

    local procedure CheckMasterDataEditAllowance(EditTypePar: Option Insert,Modify,Delete,Rename)
    var
        userSetupLoc: Record "User Setup";
        throwErrorLoc: Boolean;
        errNoAllowance2EditMasterData: TextConst ENU = 'You are not allowed to perform this action.', DEU = 'Sie sind nicht berechtigt diese Änderungen durchzuführen.';
    begin
        if not userSetupLoc.Get(UserId) then begin
            userSetupLoc.Init;
        end;

        case EditTypePar of
            EditTypePar::Insert:
                begin
                    throwErrorLoc := userSetupLoc."Allow Master Data Edit" < userSetupLoc."Allow Master Data Edit"::Edit;
                end;            
            EditTypePar::Modify:
                begin
                    throwErrorLoc := userSetupLoc."Allow Master Data Edit" < userSetupLoc."Allow Master Data Edit"::Edit;
                end;            
            EditTypePar::Rename:
                begin
                    throwErrorLoc := userSetupLoc."Allow Master Data Edit" < userSetupLoc."Allow Master Data Edit"::Edit;
                end;            
            EditTypePar::Delete:
                begin
                    throwErrorLoc := userSetupLoc."Allow Master Data Edit" < userSetupLoc."Allow Master Data Edit"::"Edit & Delete";
                end;
            else begin
                    throwErrorLoc := true;
                end;
        end;

        if throwErrorLoc then begin
            Error(errNoAllowance2EditMasterData);
        end;
    end;
}