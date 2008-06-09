From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: How do I compile a Reiser4 enabled kernel for use on opensuse
 11rc1 - 64 bit
Date: Tue, 10 Jun 2008 01:28:21 +0400
Message-ID: <484DA075.5080607@gmail.com>
References: <23466.202.168.22.19.1212986902.squirrel@webmail.velocity.net.au> <73dc97ec25ea6e13a9570f667d88b1cc@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <73dc97ec25ea6e13a9570f667d88b1cc@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: geearf@free.fr, reiserfs-devel@vger.kernel.org

John wrote:
> On Mon, 9 Jun 2008 14:48:22 +1000 (EST), doiggl@velocitynet.com.au wrote:
>   
>> Hello,
>>     
>
> Hello
>   
>> I have a reiser4 query.
>>
>> Questions.
>> 1. I would like to set up a reiser4 file system and I need help on how to
>> compile a kernel for it. Can you tell me the steps to compile and install
>> a reiser4 enabled kernel please ?.

Is "/" supposed to be on reiser4?
Note, that in this case SUSE10.3 requires initrd to contain reiser4 module.
Not sure about 11.0...

>>  I would use a vanilla kernel to patch
>> and build.
>>     
> Here you will find a tutorial for that:
> http://linuxhelp.150m.com/installs/compile-kernel.htm
>   
>> 2. What command do I use to format a blank disk partition to reiser4 ? so
>> I can use it.
>>     
> for a normal partition: mkfs.reiser4 /dev/yourpartition
> for a cryptcompress partition: mkfs.reiser4 -o create=ccreg40 /dev/yourpartition
>
>   
>> 3. How can I validate a reiser4 partition is ok ?.
>>
>>     
> fsck.reiser4 /dev/yourpartition (with the partition unmounted)?
>   
>> I am using opensuse 11 rc1 (64 bit system) on a test pc with a additional
>> hard disk with no partitions on it and would like to set up reiser4 on it.
>>
>> I can get reiser4progs and reiser4progs-devel already compiled to a rpm
>> from:
>> http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.0/x86_64/reiser4progs-1.0.6-15.3.x86_64.rpm
>> http://download.opensuse.org/repositories/home:/lmich/openSUSE_11.0/x86_64/reiser4progs-devel-1.0.6-15.3.x86_64.rpm
>>
>>     
Ok, install both, it should work.
