From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: vs-6030
Date: Mon, 17 Jul 2006 19:04:23 +0400
Message-ID: <1153148663.6311.52.camel@tribesman.namesys.com>
References: <263a8b350503031343182f4e4a@mail.gmail.com>
	 <1109923874.3504.577.camel@tribesman.namesys.com>
	 <20060717151549.ad23d5ab.reiser4@blinkenlights.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060717151549.ad23d5ab.reiser4@blinkenlights.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Ulrich <reiser4@blinkenlights.ch>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-07-17 at 15:15 +0200, Adrian Ulrich wrote:
> Hi Vladimir,
> 
> > Can you reproduce this easily?
> > If no, please tell more about what did filesystem do when panic occured.
> 
> I've seen the same problem (vs-6030) today on one of our hosts:
> 
> It happened as soon as somebody tried to write data to
> /home/$affected_user/ (..or a subdirectory)
> 
>  eg:
>   dd if=/dev/urandom of=/home/$affected_user/Temp/test
> 
> always paniced the kernel (2.6.16.11) and reiserfsck didn't show any errors.
> 

Would the system crash if you dd to another directory of the filesystem?
Would you please recompile with reiserfs debug on and crash again and
send us all kernel output related to the crash?

> 
> I created a metadump of the filesystem, would you like to have a look at it?
> 

As long as reiserfsck does not report any errors - there is no need to
look at it yet.

> Regards,
>  Adrian
> 

