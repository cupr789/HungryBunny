package co.kr.hungrybunny.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswdUtil 
{
	private static final String SALT = "smh0817!";
	
	public static String makePasswd( String passwd )
	{
		String out = null;
		
		try
		{
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.reset();
			md.update(SALT.getBytes());
			byte[] arr = md.digest(passwd.getBytes("UTF-8"));
			
			StringBuilder builder = new StringBuilder();
			
			for( byte b : arr )
			{
				builder.append( Integer.toString( b & 0xff  + 0x100 , 16 ).substring(1));
			}// end for( byte b : arr )
			
			out = builder.toString();
			
		} // end try
		catch( NoSuchAlgorithmException e )
		{
			e.printStackTrace();
		} // end catch( NoSuchAlgorithmException e )
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		} // end catch (UnsupportedEncodingException e)
		
		return out;
	}
	
	public static boolean matchPasswd( String passwd , String encPasswd )
	{
		String pass = makePasswd(passwd);
		
		if( pass.compareTo(encPasswd) == 0 )
		{
			return true;
		} // end if( pass.compareTo(encPasswd) == 0 )
		
		return false;
		
	}
	
	
}

