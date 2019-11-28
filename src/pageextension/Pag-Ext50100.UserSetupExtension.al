pageextension 50100 "User Setup Extension" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field(AllowMasterDataEdit; "Allow Master Data Edit")
            {
                ApplicationArea = All;
            }

        }
    }
}