From: "E.Gryaznova" <grev@namesys.com>
Subject: Re: Erased start of voulme...
Date: Fri, 14 Jan 2005 15:32:14 +0300
Message-ID: <41E7BBCE.9070601@namesys.com>
References: <Pine.LNX.4.61.0501131658460.28732@holly.rdwarf.net> <20050114122539.GE5661@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23143-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050114122539.GE5661@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Zarochentsev <zam@namesys.com>
Cc: Louis Erickson <lerickson@rdwarf.net>, reiserfs-list@namesys.com

Alex Zarochentsev wrote:

>Hello,
>
>On Thu, Jan 13, 2005 at 05:03:30PM -0800, Louis Erickson wrote:
>  
>
>>I don't know how it happened, but the start of the /var partition of one 
>>of the machines I run has gotten itself zeroed out.  Only the first little 
>>bit - 4k or so - is nulls, then a large amount of very plausible data 
>>appears.
>>
>>I can't get reiserfsck to even think this is a reiserfs volume - the 
>>program doesn't think this is a reiserfs volume any more.
>>    
>>
>
>  
>
>>Is there any chance of getting the data back off of this disk?  Can 
>>reiserfsck be told to look harder and recover more deeply or something?  
>>Or is this a lesson in why backups are important?
>>
>>Any suggestions you can give are welcome.
>>    
>>
>
>reiserfsck --rebuild-sb can re-create the super block.
>  
>
I would prefer to do the following :
dd if=/dev/problem_partition of=/dev/sparedevice
sparedevice can be usual disk partition
then
reiserfsck --rebuild-sb /dev/sparedevice
reiserfsck --check /dev/sparedevice

Thanks,
Lena.

>  
>
>>I'm currently running dd from the mangled partition to a file to be able 
>>to try some things without losing my only copy of the data.  If there's 
>>anything special I have to do to make that work, please let me know.
>>
>>Thank you!
>>
>>-- 
>>Louis Erickson - lerickson@rdwarf.net - http://www.rdwarf.com/~wwonko/
>>
>>Oh Dad!  We're ALL Devo!
>>    
>>
>
>  
>


