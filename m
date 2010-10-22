From: Viji V Nair <viji@fedoraproject.org>
Subject: Re: reiser4 as a module
Date: Fri, 22 Oct 2010 17:53:24 +0530
Message-ID: <AANLkTim4V9zJ9hzRxSWJwmMpicVKRpqB5GSrkZrTCgyD@mail.gmail.com>
References: <AANLkTi=o5bXDxY4XKSYzcX9fX4yHZRC68=oMk0sikViS@mail.gmail.com> <4CC167D0.1050502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:sender:received
         :in-reply-to:references:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type:content-transfer-encoding;
        bh=HvHUX3EBlwqtqjBUmuj0rLIcn0POsWsP/YtF1oJgfrA=;
        b=Sq2ndawg+qxzprFb7nf+FXKT9vacciqLWplsHIidFcs/8CTpJELvDPAktr268WKkhZ
         C/Ygl3uJyFXCRZvhqwvWGsrop1utjqu4bGfa8b2QM5BXlCuDikTxGT42ZKGiR+sfRtDj
         LRsK5cZOuOBRTGFqNCwQboKMRadkC3cD/AuN0=
In-Reply-To: <4CC167D0.1050502@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Fri, Oct 22, 2010 at 4:00 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Viji V Nair wrote:
>> Hi,
>>
>>
>
> Hello.
>
>> I have been trying to build reiser4 as a module, but the module whic=
h
>> is getting compiled having the "symbol" issue.
>>
>> <snip>
>> reiser4: Unknown symbol lzo1x_1_compress
>> reiser4: Unknown symbol might_fault
>> reiser4: Unknown symbol mutex_lock_nested
>> reiser4: Unknown symbol zlib_deflate
>> reiser4: Unknown symbol writeback_inodes_wbc
>> </snip>
>>
>
>
> How to reproduce?

1. Download and install fedora kernel source package for latest fedora
kernel (f13)
2. Patch for reiser4
3. make the module (Warning of missing Module.symvers)

# make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn M=3Dfs/reiser4

4. Insert the module

# insmod fs/reiser4/reiser4.ko
# insmod: error inserting 'fs/reiser4/reiser4.ko': -1 Unknown symbol in=
 module

# dmesg

reiser4: Unknown symbol lzo1x_1_compress
reiser4: Unknown symbol might_fault
reiser4: Unknown symbol mutex_lock_nested
reiser4: Unknown symbol zlib_deflate
reiser4: Unknown symbol writeback_inodes_wbc
reiser4: Unknown symbol zlib_deflateReset
reiser4: Unknown symbol __raw_spin_lock_init
reiser4: Unknown symbol generic_writeback_sb_inodes
reiser4: Unknown symbol zlib_deflate_workspacesize
reiser4: Unknown symbol zlib_deflateInit2
reiser4: Unknown symbol inode_lock
reiser4: Unknown symbol _raw_spin_unlock_irq
reiser4: Unknown symbol _raw_spin_lock_nested
reiser4: Unknown symbol _raw_read_unlock
reiser4: Unknown symbol _raw_write_unlock
reiser4: Unknown symbol debug_lockdep_rcu_enabled
reiser4: Unknown symbol lock_acquire
reiser4: Unknown symbol lock_release
reiser4: Unknown symbol __rwlock_init
reiser4: Unknown symbol writeback_skip_sb_inodes
reiser4: Unknown symbol set_page_dirty_notag
reiser4: Unknown symbol _raw_spin_unlock
reiser4: Unknown symbol find_get_pages
reiser4: Unknown symbol rcu_lock_map



> What stuff are you using?

I am Fedora 13 x86_64

# uname -a
Linux dev06 2.6.34.7-56.fc13.x86_64 #1 SMP Wed Sep 15 03:36:55 UTC
2010 x86_64 x86_64 x86_64 GNU/Linux

>
> Thanks,
> Edward.
>
>> I could see from the reiser4 2.6.34 patch that it is adding
>> "EXPORT_SYMBOL" to few files in fs & mm directories of the kernel
>> source tree. Can we have all these symbols defined in the core sourc=
e
>> tree of resier4 also? Do we have a patch for this already?
>>
>> Thanks
>> Viji
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
