From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: ReiserFS on Linux 2.6.7 kernel
Date: Mon, 28 Jun 2004 17:48:59 +0400
Message-ID: <40E021CB.4040403@namesys.com>
References: <20040628133149.31608.qmail@web53304.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040628133149.31608.qmail@web53304.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ashish Rathi <ashish_pspl@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello

Ashish Rathi wrote:
> Hi 
> 
> I am pretty new to ReiserFS and have a very basic
> question to ask. 
> 
> I recently upgraded to the 2.6.7 kernel available on
> kernel.org. On the ReiserFS download page, I see that
> ReiserFS 4 is being still listed as "experimental" for
> the Linux 2.6 kernel.
> So what version of ReiserFS does the 2.6.7 kernel
> include ? Is it 3.6.17 ? Where do I look in order to
> find this info ?
> 

Stock 2.6.7 includes reiserfs. Just turn its support on via make 
config/menuconfig/xconfig.

You can get userlang tools (mkreiserfs, reiserfsck) at 
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.17.tar.gz


> I'll be glad if someone could help me out here.
> 
> Thanks
> Ashish
> 
> 
> 
> 
> 
> 
> 
> 		
> __________________________________
> Do you Yahoo!?
> New and Improved Yahoo! Mail - Send 10MB messages!
> http://promotions.yahoo.com/new_mail 
> 
> 


