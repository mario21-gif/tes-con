echo.X=MsgBox("Msg",0+16,"Title") >> FakeErrorMsg.vbs

echo.X=MsgBox("Msg",1+10,"Title") >> FakeErrorMsg1.vbs

echo.X=MsgBox("Msg",2+32,"Title") >> FakeErrorMsg2.vbs

echo.X=MsgBox("Msg",3+48,"Title") >> FakeErrorMsg3.vbs

:loop

start FakeErrorMsg.vbs

start FakeErrorMsg1.vbs

start FakeErrorMsg2.vbs

start FakeErrorMsg3.vbs

goto loop