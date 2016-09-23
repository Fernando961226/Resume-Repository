import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.swing.JOptionPane;

public class ImageHidding {

	public static void main(String[] args) throws IOException, URISyntaxException 
	{
		
		
		
		/*nt x=0b1111111;
		System.out.println(x);
		
		
		byte byte4=0b1111;
		byte4=(byte)(byte4&0b11111100);
		System.out.println(Integer.toBinaryString(byte4));
		System.out.println(20%3);
		
		
		
		String message="dlksandkjbfdbhbiwc";
		int length_messsage=message.length();
		System.out.println(length_messsage);
		if(length_messsage%3==1)
		{
			message+="#";
		}
		else if(length_messsage%3==2)
		{
			message+="##";
		}
		
		System.out.println(message);
		
		int [] ByteMesssage={0b11111111,0b10101010,0b11111111};
		int TotalPixels=(int) Math.ceil(ByteMesssage.length*4/3.00);
		
		System.out.println("TimeToRun "+ TotalPixels);
		
		int PixelAt=0;
		int CharacterAt=0;
		byte MoveCharacter=0;
		int bitsAdded=0;
		int [] CharacterPart= new int [4];
		
		System.out.println(ByteMesssage[0]);
		CharacterPart[0]=(ByteMesssage[0] & 0b11000000)>>6;
		System.out.println(Integer.toBinaryString(CharacterPart[0]));
		
		*/
		//Buffer and Image
		BufferedImage image = null;
		
		
		ImageReadTest imageObject= new ImageReadTest("C:\\Users\\ferna\\Pictures\\My scehdual for fall 2016.PNG");
		
		
	
		int [] BinaryString=imageObject.StringToBinary("Hello Chris the Password is 9828418123123. Shhhh It is a Secret. ");
		imageObject.ChangeRGBValue(BinaryString);
		imageObject.SaveImage("C:\\Users\\ferna\\Pictures\\test.PNG");
		ArrayList<Integer> MessageInBits=imageObject.GetImageCharacterBits();
		
		imageObject.BinaryToString(MessageInBits);
		
		
		//imageObject.BinaryToString(BinaryString);
		
		
		
		
		
		/*String BinaryString="01234560123456";
	
		
		String [] red={"0000000","0000000","0000000"}, blue={"0000000","0000000","0000000"}, green={"0000000","0000000","0000000"};
		//              0123456

		int TimesToRun=(int) Math.ceil(BinaryString.length()/6.00);
		System.out.println("TimeToRun "+ TimesToRun);
		int TimesHasRun=0;
		int bitsAdded=0;
		int i=0;
		int BitAt;
		Outside:
		for(int x=0; x<10;x++)
		{
			
				
			for(int y=0; y<10;y++)
			{	
				BitAt=TimesHasRun*6;
				red[TimesHasRun]=red[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt,BitAt+2);
				System.out.println(red[TimesHasRun]);
				blue[TimesHasRun]=blue[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt+2,BitAt+4);
				System.out.println(blue[TimesHasRun]);
				green[TimesHasRun]=green[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt+4,BitAt+6);
				System.out.println(green[TimesHasRun]);
				TimesHasRun++;
				System.out.println("---------------------"+TimesHasRun+"-----------------");
				if((TimesHasRun+1)>=TimesToRun)
				{
					System.out.println("Breaking loop !!!!!!!!");
					break Outside;
					
				}
				
			}
			
		}
		
		BitAt=TimesHasRun*6;
		if((BinaryString.length()-BitAt)==5)
		{
			red[TimesHasRun]=red[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt,BitAt+2);
			blue[TimesHasRun]=blue[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt+2,BitAt+4);
			green[TimesHasRun]=green[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt=+4,BitAt+5) + green[TimesHasRun].substring(6);
			
		}
		else if((BinaryString.length()-BitAt)==4)
		{
			red[TimesHasRun]=red[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt,BitAt+2);
			blue[TimesHasRun]=blue[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt+2,BitAt+4);	
		}
		else if((BinaryString.length()-BitAt)==3)
		{
			red[TimesHasRun]=red[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt,BitAt+2);
			blue[TimesHasRun]=blue[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt+2,BitAt+3) + blue[TimesHasRun].substring(6);	
		}
		else if((BinaryString.length()-BitAt)==2)
		{
			red[TimesHasRun]=red[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt,BitAt+2);	
		}
		else
		{
			red[TimesHasRun]=red[TimesHasRun].substring(0,5) + BinaryString.substring(BitAt,BitAt+1) + red[TimesHasRun].substring(6);
		}
		
		for( int j=0; j<red.length;j++)
		{
			System.out.println(red[j]);
			System.out.println(blue[j]);
			System.out.println(green[j]);
		}
		

			*/
	
		
		/*File file = new File("C:\\Users\\fernando.penacantu\\workspace\\Stenography\\src\\test2..jpg");
		System.out.println(file.exists());
		for (File f : file.listFiles()) {
			System.out.println("  => " + f.getAbsolutePath());
		}*/
	}

	
	

	
}
