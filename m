From: Hans Reiser <reiser@namesys.com>
Subject: Re: New Reiser4 snapshot slower?
Date: Fri, 26 Mar 2004 11:38:53 -0800
Message-ID: <406486CD.7090600@namesys.com>
References: <1080334838.23552.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1080334838.23552.2.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>, zam@thebsh.namesys.com

Jonathan Briggs wrote:

>This command:
># dd if=/dev/zero of=testfile bs=4k count=256k
>seems to take longer than it did before.  The difference seems to be all
>system time.
>
>I will have to reboot to an old version later, to get accurate numbers.
>
>I don't have debugging turned on, so that's not it.  Has something
>changed that would have made this slower?
>  
>
zam, please look into this report.

-- 
Hans

