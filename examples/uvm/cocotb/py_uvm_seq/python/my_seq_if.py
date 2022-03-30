#****************************************************************************
#* my_seq_if.py
#****************************************************************************
import tblink_rpc

@tblink_rpc.iftype("my_seq_if")
class MySeqIf(object):
    pass

    @tblink_rpc.imptask
    async def body(self):
        print("Hello from body", flush=True)
        pass

    
        