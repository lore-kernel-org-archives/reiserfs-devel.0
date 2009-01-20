From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Re2: Reiserfs3 is crashing - where/whom to report?
Date: Tue, 20 Jan 2009 13:45:30 +0300
Message-ID: <4975AB4A.4070607@gmail.com>
References: <49750FC1.23700.2C929@JaFojtik.seznam.cz>, <497518E3.4080205@gmail.com> <49759410.20384.D37CA@JaFojtik.seznam.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49759410.20384.D37CA@JaFojtik.seznam.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jaroslav Fojtik <JaFojtik@seznam.cz>
Cc: Jeff Mahoney <jeffm@suse.com>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Jaroslav Fojtik wrote:
> Dear Shishkin,
>
>   
>> would you please check your partition with fsck,
>> and, please, upgrade the kernel, if possible.
>>     
> Yes, I can. Now I have a new format of HDD, so fschk is meaningless. 
> If it is neccessary, I could reproduce a bug again, change format 
> (mkreiserfs) and do a hard load until reiserfs crash. Do you want 
> me to do this?
>   HDD is still clean and free for experiments. After while, I will
> use HDD for regular data storage.
>
> I am using linux-2.6.21.5 now. I cannot upgrade to >linux-2.6.24.7,
> because MadWiFi stops to be compiled.
>
>   

Ok, please, have the 2.6.24.7 kernel and reiserfsprogs-3.6.21
to format a partition:
http://www.kernel.org/pub/linux/utils/fs/reiserfs/reiserfsprogs-3.6.21.tar.gz
Catch all kernel messages and describe steps to reproduce the crash.

Thanks,
Edward.
