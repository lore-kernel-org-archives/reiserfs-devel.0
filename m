From: Hans Reiser <reiser@namesys.com>
Subject: Re: disk or reiserfs problem?
Date: Mon, 02 Jun 2003 22:36:00 +0400
Message-ID: <3EDB9910.7040005@namesys.com>
References: <E19L7Co-0002Sb-00@rode.parc.com> <20030529054511.GA30925@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030529054511.GA30925@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Jeff Breidenbach <jbreiden@parc.com>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Wed, May 28, 2003 at 01:07:27PM -0700, Jeff Breidenbach wrote:
>  
>
>>This is after a hard (power switch) reboot (due to I/O errors). The
>>disk in question has about 125 GB of data on a single 200GB reiserfs
>>partition. Do people think the disk is toast, or is this possibly some
>>correctable filesystem problem? The machine is remote, so I can't
>>hdb1: bad access: block=35, count=5
>>end_request: I/O error, dev 03:41 (hdb), sector 35
>>    
>>
>
>Looks like disk have gone bad. If you are lucky enough, some of the data
>still can be recovered. Try to copy entire disk into a file/to another
>disk to see how much bad sectors are there.
>
>Bye,
>    Oleg
>
>
>  
>
You should provide more details in such advice, such as telling him 
about dd_rescue and why it is better than dd, etc.  You should also 
explain that if it is only a few blocks that are bad, writing to the bad 
blocks can make them go away most of the time (the drive will remap them).

-- 
Hans


