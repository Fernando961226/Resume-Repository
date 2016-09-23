import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.imageio.ImageIO;

public class ImageReadTest 
{
	BufferedImage image = null;
	File file = null;
	int wordLength;

	public ImageReadTest(String file_path) throws URISyntaxException, IOException
	{
			file = new File(file_path);
			if(file.exists())
			{
				image =ImageIO.read(file);
			}
			else
			{
				System.out.println("file does not exit");
				System.exit(0);
			}
			
	}
	public void ChangeRGBValue(int [] ByteMesssage)
	{
		System.out.println("!---------- Changing the RGB Values ------------!");
		Color c;
		
		int rgb;
		int x=0,y=0;
	
	
		
		int TotalPixels=(int) Math.ceil(ByteMesssage.length*4/3.00);
		
		if(image.getHeight()*image.getWidth()< TotalPixels)
		{
			
			System.out.println("Image is to small to contains the message. Soory choose a bigger Image");
			System.exit(0);
		}
		
		System.out.println("Totalpixels "+ TotalPixels);
		
		int PixelAt=0;
		int CharacterAt=0;
		byte MoveCharacter=0;
		int [] CharacterPart= new int [4];
		CharacterPart[0]=(ByteMesssage[0] & 0b11000000)>>6; 
		CharacterPart[1]=(ByteMesssage[0] & 0b00110000)>>4; 
		CharacterPart[2]=(ByteMesssage[0] & 0b00001100)>>2;
		CharacterPart[3]=(ByteMesssage[0] & 0b00000011);
		
		int red=0, blue = 0, green=0;
		
		Outside:
		for( x=0; x<image.getWidth();x++)
		{
			
				
			for(y=0; y<image.getHeight();y++)
			{	
				System.out.println("Start loop "+PixelAt);
				
				c =new Color(image.getRGB(x, y));
				red=c.getRed();
				blue=c.getBlue();
				green=c.getGreen();
				
				System.out.println("colors of pixel orginal"+red+" "+blue+" "+green);
				
				
				
				if(MoveCharacter==4)
				{
					System.out.println("Reseting-----------------");
				MoveCharacter=0;
				CharacterAt++;
				System.out.println("Starting CharacterAt"+CharacterAt);
				CharacterPart[0]=(ByteMesssage[CharacterAt] & 0b11000000)>>6;
				CharacterPart[1]=(ByteMesssage[CharacterAt] & 0b00110000)>>4;
				CharacterPart[2]=(ByteMesssage[CharacterAt] & 0b00001100)>>2;
				CharacterPart[3]=(ByteMesssage[CharacterAt] & 0b00000011);
				}
			
				if((PixelAt+1)>=TotalPixels)
				{
					System.out.println("Breaking loop !!!!!!!!");
					break Outside;
					
				}
				
				
				
				//red part
				red=(red & 0b11111100);
				
				switch(MoveCharacter)
				{
					case 0:
						red+=CharacterPart[0];
					break;
					case 1:
						red+=CharacterPart[1];
					break;
					case 2:
						red+=CharacterPart[2];
					break;
					case 3:
						red+=CharacterPart[3];
					break;
					default:
						System.out.println("Incorrect Number Error");
					break;
				}
				
				System.out.println("red["+PixelAt+"]"+Integer.toBinaryString(red));
				MoveCharacter++;
				System.out.println("Move to Character "+MoveCharacter);
				if(MoveCharacter==4)
				{
					System.out.println("Reseting---------------------------");
				MoveCharacter=0;
				CharacterAt++;
				System.out.println("Starting CharacterAt"+CharacterAt);
				CharacterPart[0]=(ByteMesssage[CharacterAt] & 0b11000000)>>6;
				CharacterPart[1]=(ByteMesssage[CharacterAt] & 0b00110000)>>4;
				CharacterPart[2]=(ByteMesssage[CharacterAt] & 0b00001100)>>2;
				CharacterPart[3]=(ByteMesssage[CharacterAt] & 0b00000011);
				}
				
				
				//blue part
				blue=(blue & 0b11111100);
				
				switch(MoveCharacter)
				{
					case 0:
						blue+=CharacterPart[0];
					break;
					case 1:
						blue+=CharacterPart[1];
					break;
					case 2:
						blue+=CharacterPart[2];
					break;
					case 3:
						blue+=CharacterPart[3];
					break;
					default:
						System.out.println("Incorrect Number Error");
					break;
				}
				System.out.println("blue["+PixelAt+"]"+Integer.toBinaryString(blue));
				MoveCharacter++;
				System.out.println("Move to Character "+MoveCharacter);
				if(MoveCharacter==4)
				{
					System.out.println("Reseting------------------");
				MoveCharacter=0;
				CharacterAt++;
				System.out.println("Starting CharacterAt"+CharacterAt);
				CharacterPart[0]=(ByteMesssage[CharacterAt] & 0b11000000)>>6;
				CharacterPart[1]=(ByteMesssage[CharacterAt] & 0b00110000)>>4;
				CharacterPart[2]=(ByteMesssage[CharacterAt] & 0b00001100)>>2;
				CharacterPart[3]=(ByteMesssage[CharacterAt] & 0b00000011);
				}
				
				
				//green part
				green=(green & 0b11111100);
				
				switch(MoveCharacter)
				{
					case 0:
						green+=CharacterPart[0];
					break;
					case 1:
						green+=CharacterPart[1];
					break;
					case 2:
						green+=CharacterPart[2];
					break;
					case 3:
						green+=CharacterPart[3];
					break;
					default:
						System.out.println("Incorrect Number Error");
					break;
				}
				System.out.println("green["+PixelAt+"]"+Integer.toBinaryString(green));
				MoveCharacter++;
				System.out.println("Move to Character "+MoveCharacter);
				
				//Setting the color of pixel
				System.out.println("Setting the color of pixel");
				rgb=new Color(red,green,blue).getRGB();
				image.setRGB(x, y, rgb);
				
				
				PixelAt++;
				
		
		
			}
		}
		
		red=(red & 0b11111100);
		blue=(blue & 0b11111100);
		green=(green & 0b11111100);
		switch(MoveCharacter)
		{
			case 0:
				System.out.println("Something when wrong");
			break;
			case 1:
				red+=CharacterPart[1];
				System.out.println("End red["+PixelAt+"]"+Integer.toBinaryString(red));
				blue+=CharacterPart[2];
				System.out.println("End blue["+PixelAt+"]"+Integer.toBinaryString(blue));
				green+=CharacterPart[3];
				System.out.println("End green["+PixelAt+"]"+Integer.toBinaryString(green));
				
			break;
			case 2:
				red+=CharacterPart[2];
				System.out.println("End red["+PixelAt+"]"+Integer.toBinaryString(red));
				blue+=CharacterPart[3];
				System.out.println("End blue["+PixelAt+"]"+Integer.toBinaryString(blue));
			break;
			case 3:
				red+=CharacterPart[3];
				System.out.println("End red["+PixelAt+"]"+Integer.toBinaryString(red));
			break;
			default:
				System.out.println("Something when wrong");
			break;
		}
		
		System.out.println("Setting the color of pixel");
		rgb=new Color(red,green,blue).getRGB();
		image.setRGB(x, y, rgb);		
		
	}
	
	public BufferedImage GetImage()
	{
		return image;
	}
	public ArrayList<Integer> GetImageCharacterBits()
	{
		System.out.println("!---------- Changing the Message in Bits Back ------------!");
		Color c;
		
		int rgb;
		int x=0,y=0;
		
		
		
		
		//int TotalPixels=(int) Math.ceil(ByteMesssage.length*4/3.00);
		
		//System.out.println("Totalpixels "+ TotalPixels);
		
		int PixelAt=0;
		int CharacterAt=0;
		byte MoveCharacter=0;
		//where to enter the added bits
		ArrayList<Integer> MessageInBits = new ArrayList<Integer>();
		
		// the parts of each bit
		int [] BitParts= new int [4];
		
		BitParts[0]=0; 
		BitParts[1]=0; 
		BitParts[2]=0;
		BitParts[3]=0;
		
		int red=0, blue = 0, green=0;
		
		Outside:
		for( x=0; x<image.getWidth();x++)
		{
			
				
			for(y=0; y<image.getHeight();y++)
			{	
				System.out.println("Start loop "+PixelAt);
				
				c =new Color(image.getRGB(x, y));
				//getting the color of each pixel
				red=c.getRed();
				blue=c.getBlue();
				green=c.getGreen();
				
				
				
				
				//if we got the 4 pixels move to the next character
				if(MoveCharacter==4)
				{
				System.out.println("Reseting && compling byte-----------------");
				MessageInBits.add(BitParts[0]+BitParts[1]+BitParts[2]+BitParts[3]);
				System.out.println(MessageInBits.get(CharacterAt));
				
				
				if((CharacterAt>=4 && MessageInBits.get(CharacterAt)==38 && MessageInBits.get(CharacterAt-1)==94 && MessageInBits.get(CharacterAt-2)==37 && MessageInBits.get(CharacterAt-3)==36))
				{
					System.out.println("Gotten all characters breaking loop!!!!!!!!");
					System.out.println("Breaking loop !!!!!!!!");
					break Outside;
					
				}
				
				MoveCharacter=0;
				CharacterAt++;
				System.out.println("Starting CharacterAt"+CharacterAt);
				//Compile characters into one byte and add it to the array list
				
				}
			
				
				
				
				
				//Get the bits in red
				red=(red & 0b00000011);
				
				switch(MoveCharacter)
				{
					case 0:
						BitParts[0]=red<<6;
					break;
					case 1:
						BitParts[1]=red<<4;
					break;
					case 2:
						BitParts[2]=red<<2;
					break;
					case 3:
						BitParts[3]=red<<0;
					break;
					default:
						System.out.println("Outside of bits we must gather Error");
					break;
				}
				
				System.out.println("red["+PixelAt+"]"+Integer.toBinaryString(red));
				MoveCharacter++;
				System.out.println("Move to Character "+MoveCharacter);
				if(MoveCharacter==4)
				{
					System.out.println("Reseting && compling byte-----------------");
					MessageInBits.add(BitParts[0]+BitParts[1]+BitParts[2]+BitParts[3]);
					System.out.println(MessageInBits.get(CharacterAt));
					
					if((CharacterAt>=4 && MessageInBits.get(CharacterAt)==38 && MessageInBits.get(CharacterAt-1)==94 && MessageInBits.get(CharacterAt-2)==37 && MessageInBits.get(CharacterAt-3)==36))
					{
						System.out.println("Gotten all characters breaking loop!!!!!!!!");
						System.out.println("Breaking loop !!!!!!!!");
						break Outside;
						
					}
					
					MoveCharacter=0;
					CharacterAt++;
					System.out.println("Starting CharacterAt"+CharacterAt);
					//Compile characters into one byte and add it to the array list
				}
				
				
				//blue part
				blue=(blue & 0b00000011);
				
				switch(MoveCharacter)
				{
					case 0:
						BitParts[0]=blue<<6;
					break;
					case 1:
						BitParts[1]=blue<<4;
					break;
					case 2:
						BitParts[2]=blue<<2;
					break;
					case 3:
						BitParts[3]=blue;
					break;
					default:
						System.out.println("Outside of bits we must gather Error");
					break;
				}
				System.out.println("blue["+PixelAt+"]"+Integer.toBinaryString(blue));
				MoveCharacter++;
				System.out.println("Move to Character "+MoveCharacter);
				if(MoveCharacter==4)
				{
					System.out.println("Reseting && compling byte-----------------");
					MessageInBits.add(BitParts[0]+BitParts[1]+BitParts[2]+BitParts[3]);
					System.out.println(MessageInBits.get(CharacterAt));
					
					if((CharacterAt>=4 && MessageInBits.get(CharacterAt)==38 && MessageInBits.get(CharacterAt-1)==94 && MessageInBits.get(CharacterAt-2)==37 && MessageInBits.get(CharacterAt-3)==36))
					{
						System.out.println("Gotten all characters breaking loop!!!!!!!!");
						System.out.println("Breaking loop !!!!!!!!");
						break Outside;
						
					}
					
					MoveCharacter=0;
					CharacterAt++;
					System.out.println("Starting CharacterAt"+CharacterAt);
					//Compile characters into one byte and add it to the array list
				}
				
				
				//green part
				green=(green & 0b00000011);
				
				switch(MoveCharacter)
				{
					case 0:
						BitParts[0]=green<<6;
					break;
					case 1:
						BitParts[1]=green<<4;;
					break;
					case 2:
						BitParts[2]=green<<2;;
					break;
					case 3:
						BitParts[3]=green;
					break;
					default:
						System.out.println("Outside of bits we must gather Error");
					break;
				}
				System.out.println("green["+PixelAt+"]"+Integer.toBinaryString(green));
				MoveCharacter++;
				System.out.println("Move to Character "+MoveCharacter);
				
				//Setting the color of pixel
				
				
				
				PixelAt++;
				
		
		
			}
		}
		
		return MessageInBits;
		
		
	}
	
	public void SaveImage(String path) throws IOException
	{
		File newImage = new File(path);
		ImageIO.write(image, "png", newImage);
	}
	

	
	public String BinaryToString(	ArrayList<Integer> MessageInBits) {
		System.out.println("----------------------BinaryToString-------------------------");
		
		String Message="";
		
		Iterator<Integer> itr =MessageInBits.iterator();
		while(itr.hasNext())
		{
			Message+=Character.toString((char)((int)(itr.next())));
		}
		Message=Message.substring(0,Message.length()-4);
		System.out.println(Message);
		return Message;
	}
	
	
	public int [] StringToBinary(String word)
	{
		System.out.println("----------------------StringToBinary-------------------------");
		
		
		//System.out.println("Increasing the length of message to make it divisble by 3");
		
		word=word+"$%^&";
		char x;
		wordLength=word.length();
		int[] ASCII_Values=new int [wordLength];
		System.out.println("Length of Message"+wordLength);
		for (int i=0; i<word.length();i++)
		{
			x=word.charAt(i);
			
			
			System.out.println(Integer.toBinaryString((int)(x))+" "+(int)(x));
			ASCII_Values[i]=((int)(x));;
			
		}
		
		
		return ASCII_Values;
	}

}
