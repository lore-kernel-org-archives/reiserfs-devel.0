From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: we have got hash function screwed up
Date: Tue, 06 Sep 2005 16:06:51 +0400
Message-ID: <431D865B.8040604@namesys.com>
References: <431C738F.4010803@freemail.hu> <b14e81f00509051031158e3f0e@mail.gmail.com> <431D5D1D.2090709@namesys.com> <431D72C5.105@freemail.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010301010007060601040305"
Return-path: <reiserfs-list-return-25874-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431D72C5.105@freemail.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Gabor HALASZ <halasz.g@freemail.hu>, ReiserFS Mailing List <reiserfs-list@namesys.com>

--------------010301010007060601040305
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello

Gabor HALASZ wrote:
> Vladimir V. Saveliev wrote:
>> Hello
>>
>> michael chang wrote:
>>
>>> On 9/5/05, Gabor HALASZ <halasz.g@freemail.hu> wrote:
>>>
>>>
>>>> root@sk8n:~# touch
>>>> /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
>>>>
>>>> touch: cannot touch
>>>> `/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb':
>>>>
>>>> Device or resource busy
>>>
>>>> What can I do?!
>>>
>>
>> Can you send output of ls /home/ftpd/pub/debian/pool/main/x/xorg-x11/ ?
> 
> It's really required?! Contains only 156 .deb files, mirrored from
> de.debian.org.
> 

Yes. It looks like something is wrong in that directory. Would you please run the attached program:
readdir /home/ftpd/pub/debian/pool/main/x/xorg-x11/ and send the output?


>> You should be able to create this file in other directory.
> 
> root@sk8n:~# touch
> /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
> 
> touch: cannot touch
> `/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb':
> Device or resource busy
> root@sk8n:~# touch
> /home/ftpd/pub/debian/pool/main/x/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
> 
> 
>> Or create file with other name in that directory.
> 
> root@sk8n:~# touch
> /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb
> 
> touch: cannot touch
> `/home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.deb':
> Device or resource busy
> root@sk8n:~# touch
> /home/ftpd/pub/debian/pool/main/x/xorg-x11/.in.xserver-xorg_6.8.2.dfsg.1-6_i386.dec
> 
> 
> 


--------------010301010007060601040305
Content-Type: text/x-c;
 name="readdir.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="readdir.c"

#include <stdio.h>
#include <dirent.h>

int main(int argc, char **argv)
{
	DIR *dp;
	struct dirent *ep;
	int nr;

	if (argc != 2) {
		printf("usage: %s dirname\n", argv[0]);
		return 0;
	}
	dp = opendir (argv[1]);
	if (dp == NULL) {
		perror("openfailed");
		return 0;
	}
	nr = 0;
	while ((ep = readdir(dp))) {
		printf("\"%s\", len %d, off %ld\n",
		       ep->d_name, ep->d_reclen, ep->d_off);
		nr ++;
	}
	closedir(dp);

	printf("%d entried are read\n", nr);
	return 0;
}


--------------010301010007060601040305--
