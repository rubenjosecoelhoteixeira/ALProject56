table 50008 MyBlobTable
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; ID; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(2; BlobField; Blob)
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

    procedure SetBlobValue(value: Text)
    var
        outStr: OutStream;
    begin
        BlobField.CreateOutStream(outStr);
        outStr.WriteText(value);
    end;

    procedure GetBlobValue(value: Text)
    var
        inStr: InStream;
    begin
        CalcFields(BlobField);
        if BlobField.HasValue() then begin
            BlobField.CreateInStream(inStr);
            inStr.ReadText(value);
        end
        else
            value := 'No value on the BLOB field';
    end;
}