#include<LPC17xx.H>
int main(void)
{
	LPC_PINCON->PINSEL1 = 0x00000000;
	LPC_GPIO0->FIODIR = 0x03000000;
	
	while(1)
	{
		if (!(LPC_GPIO2->FIOPIN & 0X00000800))
		{
			LPC_GPIO0->FIOSET = 0x03000000;
		}
		else
		{
			LPC_GPIO0->FIOCLR = 0x03000000;
		}
	}
}