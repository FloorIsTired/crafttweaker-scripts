#priority 200

public class Logger {
    private static var SEPARATOR as string = "=====================================================";
    
    public static printStart(scriptName as string) as void {
        println(SEPARATOR);
        println("          STARTING CALL: "+scriptName+"                  ");
        println(SEPARATOR);
    }

    public static printEnd(scriptName as string) as void {
        println(SEPARATOR);
        println("            ENDING CALL: "+scriptName+"                  ");
        println(SEPARATOR);
    }
}

