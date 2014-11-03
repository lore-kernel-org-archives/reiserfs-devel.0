From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: Reiser4 for 3.16.2 problem: mount: mount /dev/md125 on
 /mnt/backup failed: Cannot allocate memory
Date: Mon, 3 Nov 2014 17:14:23 +0100
Message-ID: <CADW=+3=MTEEbt3hvSLRmutDmXCm2D0UwsNOmmqUhsuL4DsTeXg@mail.gmail.com>
References: <CADW=+3nWaMdFCpoKQSErTQPu7YHm=4UJEZfZFnn8wOKX9tKrKg@mail.gmail.com>
	<1897499.AEq9pxZicq@intelfx-laptop>
	<54579E67.5070907@gmail.com>
	<3573664.k2atxmXvKX@intelfx-laptop>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=dTfnBBZFPN5m87y9lgiWNVwS7enrD/sPWpZZ5syOmBA=;
        b=RBe1z2LF+kC4RL496FSDpJuYWACiA9Bkawo4spI9L7s6UzfTAnTE2pituZGLnBmBOE
         PgYRuS0qMbcULb4DaA5/pNwJl67HQ6Gr5Qh2N3B1/spBXW7bFK2U6ro/qp+kKrLMuC8R
         avWb//lvbRHsGdR0DaottPH9mVozSDpDYZ7TrZzp88P4GZtvDREfyavcw62ZAa45kL83
         UelkHu/FM8nuktWv5g/BVzHCT07veGKhwjU8hFdPzNaHkdoRUHUZfyNBld2ckwCwymJB
         RIEwDIIRrCOImvWDKihDDB8pUu84xbJO8CwZu1xfqnm0O8E80xBqQ6pdJ3iaDBd358wA
         IBzQ==
In-Reply-To: <3573664.k2atxmXvKX@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Mon, Nov 3, 2014 at 4:50 PM, Ivan Shapovalov <intelfx100@gmail.com> wrote:
> On Monday 03 November 2014 at 16:25:27, Edward Shishkin wrote:
>> On 11/03/2014 04:12 PM, Ivan Shapovalov wrote:
>> > On Monday 03 November 2014 at 15:01:38, Edward Shishkin wrote:
>> >> [...]
>> >>
>> >> Somebody steals pages of compressed file's address space.
>> >> It can be e.g. because of races. I don't have any ideas except
>> >> code inspection...
>> > Do you remember the migration issue? Can't it be related?
>>
>> I don't think so: page migration is disabled in reiser4..
>
> I know. What I'm trying to say: aren't there any other similar mechanisms
> in the kernel?
Last time I enabled page migration in kernel so I tried to find what's
the difference between kernel config that worked and that fails:

krshina3 linux-3.16.5-gentoo # diff -du ./.config configBAD |grep
"+"|grep -v "#"|grep -v "@@"
--- ./.config   2014-11-03 17:09:03.895249969 +0100
+++ configBAD   2014-10-24 01:27:07.677613236 +0200
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_FAIR_GROUP_SCHED=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_SCHED_MC=y
+CONFIG_KSM=y
+CONFIG_X86_INTEL_PSTATE=y
+CONFIG_EDAC=y
+CONFIG_EDAC_LEGACY_SYSFS=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_INFO_REDUCED=y
+CONFIG_FRAME_POINTER=y


krshina3 linux-3.16.5-gentoo # diff -du ./.config configBAD |grep
"-"|grep -v "#"|grep -v "@@"
--- ./.config   2014-11-03 17:09:03.895249969 +0100
+++ configBAD   2014-10-24 01:27:07.677613236 +0200
-CONFIG_USELIB=y
-CONFIG_AUDIT=y
-CONFIG_AUDITSYSCALL=y
-CONFIG_AUDIT_WATCH=y
-CONFIG_AUDIT_TREE=y
-CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_GART_IOMMU=y
-CONFIG_LCD_CLASS_DEVICE=y



>
>> > (btw, reiser4's pages are still non-migratable...)
>>
>> You still sit on the patch, which enables migration?
>
> Yeah.
>
> --
> Ivan Shapovalov / intelfx /
