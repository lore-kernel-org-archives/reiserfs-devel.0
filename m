From: "M" <martin@luminoussheep.net>
Subject: Re: REISERFS: panic... Trying to log block (prints.c:362)
Date: Tue, 14 Jun 2005 22:51:35 +0100 (BST)
Message-ID: <2773.10.10.30.4.1118785895.squirrel@10.10.30.2>
References: <61572.194.72.110.12.1118736525.squirrel@luminoussheep.net>
    <1118746893.4228.65.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-24380-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1118746893.4228.65.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> Hello
>
> On Tue, 2005-06-14 at 12:08, M wrote:
>> Hi,
>>
>> I'm trying to copy a reiserfs filesystem from a pata drive to a sata
>> drive
>> (both reiserfs) and the kernel panics every time I try with an error
>> similar to the below:
>>
>> Jun 14 07:10:41 localhost kernel: Linux version 2.6.12-rc6 (root@myth)
>> (gcc version 3.3.5 (Debian 1:3.3.5-8)) #5 Mon Jun 13 20:03:38 BST 2005
>>
>> Jun 14 07:14:36 localhost kernel: REISERFS: panic (device sda2):
>> journal-2332: Trying to log block 471, which is a log block
>
> This means that you have a filesystem corruption. Would you try to
> reiserfsck sda2?

Reiserfsck says the filesystem is very broken...

I just tested ext2 on the drive and it also fails. So sorry this looks
like a driver/drive problem. It looked convincingly like the drive was
working OK.

If anyones interested it's a VIA VT6420 SATA RAID Controller set to IDE
mode i.e. not raid.

-- 
M

