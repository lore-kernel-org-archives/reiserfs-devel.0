From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: Furure of ReiserfsV3?
Date: Thu, 30 Oct 2003 19:03:20 +0800 (HKT)
Message-ID: <5538.38705313883$1067569752@news.gmane.org>
References: <3F9FC877.9000903@gmx.net>      
    <1067436839.1632.253.camel@tiny.suse.com> <3F9FCF40.8060807@gmx.net>   
    <.192.168.0.99.1067382465.squirrel@sml.dyndns.org>   
    <3F9FE068.5060303@osiris.at>
    <.202.66.40.14.1067446837.squirrel@sml.dyndns.org>
    <3FA10515.4080403@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-15945-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FA10515.4080403@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Very interesting for your suggestion, does anyone got a benchmark to
compare XFS with reiserfs3 for large amount data process ? ( I am talking
about 20-30GB data pulling at once ) Thanks

> Thomas Graham wrote:
>>
>> Thanks, does reiserfs4 are stable to use after apply patches ?
>> and would it be back port into 2.4.x kernel ? Thanks.
> As far as I know reiser4 is currently in Alpha stage and
> no one should use it in production systems.
> The developers can still crash this filesystem.
>
> Reiser4 has a plugin architecture which makes it possible to add
> features, but it currently has less features than reiser3.
>
> Reiser4 is currently not even in the official 2.6 kernel series and
> to my knowledge Namesys does not plan to backport it to the 2.4 series,
> either.
>
>
> My own subjective experience with Linux filesystems on 2.4 is:
> ==============================================================
> ext2: rock solid, very good performance, best fsck tools, good chances
>        of data recovery
> ext3: stable, good performance, best fsck tools, compatible with ext2
> reiserfs: very stable, excellent performance for small files (proxy
>            cache, webserver, software developer), no quotas, good fsck
>            tools, very sensitive to dying hardware
> reiserfs + data logging + quota patches: stable, excellent performance
>                                           for small files, good fsck
>                                           tools, sensitive to dying
>                                           hardware
> xfs: stable, good performance, excellent performance for large
>       files, huge feature set, best for samba, good fsck tools,
>       sensitive to dying hardware
> jfs: stable, till 2.4.22 lower performance than other fs, for ibm
>       converts
> --
> lg, Chris
>
>
>


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
