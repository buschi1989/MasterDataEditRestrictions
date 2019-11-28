tableextension 50100 "User Setup Table Extension" extends "User Setup"
{
    fields
    {
        field(50100; "Allow Master Data Edit"; Option)
        {
            Caption = 'Allow Master Data Edit';
            OptionMembers = " ","Edit","Edit & Delete";
            OptionCaption = ' ,Edit,Edit & Delete';
        }
    }
}