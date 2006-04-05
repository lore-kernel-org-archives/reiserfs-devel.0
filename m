From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: bad blocks on disk. Which files are damaged?
Date: Wed, 05 Apr 2006 19:20:38 +0400
Message-ID: <1144250438.8444.135.camel@tribesman.namesys.com>
References: <BAY24-F14A8F21FB4DCCAFF18E792DCCB0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28448-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <BAY24-F14A8F21FB4DCCAFF18E792DCCB0@phx.gbl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: el jeskynar <jeskynar@hotmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-04-05 at 15:12 +0000, el jeskynar wrote:
> Hello,
> 
> I never did see an answer to the original poster's question:
> 
> "I'd really like to find out which files on the Reiser3.6 FS on the 
> defective
> disk are probably damaged."
> 
> The bad-block-handling document doesn't seem to cover this,
> how can one find out the names of files containing bad blocks?
> 
I guess that such files will get listed by the below command:

find -type f -exec cat {} > /dev/null \;


> I've seen mention of icheck and ncheck tools but 1) I can't find
> them, and 2) I presume they would not work with reiserfs unless
> specifically written so.
> 
> Thank you!
> 
> _________________________________________________________________
> Express yourself instantly with MSN Messenger! Download today - it's FREE! 
> http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
> 
> 

