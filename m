From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: optimal kernel version for testing reiser4
Date: Mon, 06 Sep 2004 13:11:44 +0400
Message-ID: <1094461904.1341.108.camel@tribesman.namesys.com>
References: <413A4D7A.8090909@dermichi.com>
	 <1094458373.1341.102.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21505-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1094458373.1341.102.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Weissenbacher <webmaster@dermichi.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Mon, 2004-09-06 at 12:12, Vladimir Saveliev wrote:
> Hello
> 
> On Sun, 2004-09-05 at 03:19, Michael Weissenbacher wrote:
> > Can anybody tell me which kernel version is optimal for testing reiser4. 
> > I've found it runs stable on 2.6.8.1-mm2 for me except that i 
> > occasionaly get "wrong bytes" errors when doing a fsck. 
> > I read in the 
> > mailing-list archive that this error should be fixed, but is it also 
> > fixed in 2.6.8.1-mm2? 
> 
> The bug about which you read was that files got number of bytes twice
> more that they had to. This bug is fixed. 2.6.8.1-mm2 contains the fix.
> So, I assume you encounter somthing different. Would you show what does
> fsck report, please?
> 
> > I've been burned using 2.6.9-rc1-mm1 for some 
> > time, which has a problem with files which are bytes%4096=0 bytes big. 
> 
> What is that problem?
> 

Sorry, I see that now, never mind.

> > So i tried 2.6.9-rc1-mm3 today and found it was unstable on my pc (weird 
> > hangs) but i'm certain this had nothing to do with reiser4.
> > 
> > So to make it short: Which kernel do you guys use for developing/testing 
> > reiser4 
> 
> I am working with 2.6.9-rc1-mm1
> 
> > because it's hard to test when you can't tell if it's a general 
> > kernel bug or a problem specific to reiser4. Is there a patch that can 
> > be applied to the vanilla 2.6 kernel? On the website there is only the 
> > notice to use some mm-kernel. Where are the latest patches?
> > 
> 
> There is nothing yet which would have to be pushed up urgently. AFAIK.
> 
> > regards,
> > Michael
> > 
> 
> 

