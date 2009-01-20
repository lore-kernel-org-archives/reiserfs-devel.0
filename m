From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re4: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 21:19:03 +0300
Message-ID: <49761597.1060305@gmail.com>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <4975AB4A.4070607@gmail.com>, <4975E58D.6040503@suse.com> <49760EC3.25886.AFADA@JaFojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49760EC3.25886.AFADA@JaFojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaroslav Fojtik <JaFojtik@seznam.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Jaroslav Fojtik wrote:
> Dear Jeff Mahoney,
>
>   
>>> Ok, please, have the 2.6.24.7 kernel and reiserfsprogs-3.6.21
>>> to format a partition:
>>> http://www.kernel.org/pub/linux/utils/fs/reiserfs/reiserfsprogs-3.6.21.tar.gz
>>> Catch all kernel messages and describe steps to reproduce the crash.
>>>       
>> Since reiserfsprogs 3.6.21 doesn't support block sizes < 4k, he'll be
>> unable to.
>>     
>
> I would like to ask you - I have made windiff 3.6.19 and 3.6.21 and I have noted
> several changes.
>
> I can comment this piece of code if you really want to catch and fix 
> a problem found:
>     } else if (blocksize < 4096) {
>         reiserfs_warning (stderr, "Block sizes smaller than 4k "
> 			  "are not supported.\n");
> 	return 0;
>     }
>
> I do not know why these block sizes has been disabled - stability? speed?
> Overflowing block count?
>   
http://bugzilla.kernel.org/show_bug.cgi?id=9108

Reiserfs has never worked properly with small blocksizes, and it was
unpleasant surprise when I saw that it is enabled again in
reiserfsprogs-3.6.19.

IMHO there is no chances to make reiserfs work with 512K blocks.
Other cases should be carefully debugged. Put in longterm todo.

Edward.
