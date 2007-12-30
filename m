From: butdiene <butdiene@yahoo.com>
Subject: kernel messages. Re: reiser4 firefox hangs due to fsync, sysrq-t
 dump
Date: Sun, 30 Dec 2007 03:50:06 -0800 (PST)
Message-ID: <14546580.post@talk.nabble.com>
References: <14514445.post@talk.nabble.com> <14533387.post@talk.nabble.com> <5c7c368b0712291235m546eca35ne25548edffcdbf42@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5c7c368b0712291235m546eca35ne25548edffcdbf42@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org


Hi Edward,

the small patch make it impossible for me to get firefox hang for session 1.
or I should say it may hang for seconds, but wake up when the hard drive
still busy, while previously, firefox never wakes up unless the hdd is idle
again, and firefox usually hangs for minutes instead of seconds.
nevertheless, I get kernel messages from /var/log/messages for whatever I
tried but failed to hang firefox,

I removed custom mount options, so /proc/mounts is the same for both
sessions,
/dev/root / reiser4
rw,atom_max_size=0x2f20c,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
0 0

session1, kernel messages (I post only the debug messages from the patch),
if you would like to read the whole thing, let me know:

http://www.nabble.com/file/p14546580/kernel-messages1 kernel-messages1 

session 2:

I did dd for 12GB, for my 3GB ram: dd if=/dev/zero of=/tmp/tmp-dump.txt
bs=65536 count=196608 && sync

mount options are the same as in session 1, and system rebooted between
these two sessions.

kernel messages:  http://www.nabble.com/file/p14546580/kernel-messages2
kernel-messages2 

also, the patch doesn't apply cleanly, since I'm not user -mm source, the
following is the patch from my manual editing:

http://www.nabble.com/file/p14546580/reiser4-shishkin.patch
reiser4-shishkin.patch 

thanks!


Edward Shishkin-2 wrote:
> 
> On 12/29/07, butdiene <butdiene@yahoo.com> wrote:
>>
>> I'm not sure about what I'm doing. with a patch for
>> optimal_io_size=4096*1024
>> and atom_max_size=0x800, it improves a lot.
> 
> Not sure about it: reiser4 just keeps the optimal_io_size in a superblock
> to return this for stat, fstat (2), etc., and doesn't use if for anything
> else.
> Maybe firefox uses it somehow - I didn't investigate.
> 
> The following is a stacktrace where your firefox hangs. It seems there is
> an atom size "leak". To confirm it, please apply the attached patch and
> perform 2 working sessions (better with REISER4_DEBUG is on):
> session 1:
> just reproduce the firefox hang;
> session 2:
> dd if=/dev/zero of=xxx bs=65536 count=yyy && sync
> where xxx - a file on your root partition, yyy is a count to write ~4
> amount
> of RAM (if possible).
> Reboot before each session. Send me kernel messages for both sessions
> with cat /proc/mounts output.
> 
> Thanks,
> Edward.
> 
> Dec 26 17:40:49 localhost firefox-bin   D ffff810073495c78     0  8030  
> 8011
> Dec 26 17:40:49 localhost ffff810073495be8 0000000000000086
> ffff81005ce39728 ffff81005ce39728
> Dec 26 17:40:49 localhost ffff8100bf0b4dd0 ffff810073495b98
> 0000000000000008 ffffffff806b4c00
> Dec 26 17:40:49 localhost ffffffff806b4c00 ffffffff806b1c00
> ffffffff806b4c00 ffff8100b3a80140
> Dec 26 17:40:49 localhost Call Trace:
> Dec 26 17:40:49 localhost [<ffffffff802580f1>] sync_page+0x0/0x42
> Dec 26 17:40:49 localhost [<ffffffff804d36f0>] io_schedule+0x28/0x34
> Dec 26 17:40:49 localhost [<ffffffff8025812f>] sync_page+0x3e/0x42
> Dec 26 17:40:49 localhost [<ffffffff804d3c27>] __wait_on_bit+0x40/0x6e
> Dec 26 17:40:49 localhost [<ffffffff802582ab>] wait_on_page_bit+0x6c/0x72
> Dec 26 17:40:49 localhost [<ffffffff80246b70>] wake_bit_function+0x0/0x23
> Dec 26 17:40:49 localhost [<ffffffff802b8b78>] jwait_io+0x25/0x37
> Dec 26 17:40:49 localhost [<ffffffff802c97a7>]
> reiser4_write_logs+0x988/0xbee
> Dec 26 17:40:49 localhost [<ffffffff802c35c9>]
> get_current_atom_locked_nocheck+0x37/0x3e
> Dec 26 17:40:49 localhost [<ffffffff802c3a10>] reiser4_txn_end+0x355/0x4e5
> Dec 26 17:40:49 localhost [<ffffffff802c28ea>]
> reiser4_atom_wait_event+0x9a/0xa1
> Dec 26 17:40:49 localhost [<ffffffff802c3ba9>]
> reiser4_txn_restart+0x9/0x17
> Dec 26 17:40:49 localhost [<ffffffff802c3c13>] force_commit_atom+0x47/0x4b
> Dec 26 17:40:49 localhost [<ffffffff802c3e75>]
> txnmgr_force_commit_all+0xbb/0x130
> Dec 26 17:40:49 localhost [<ffffffff802d5780>]
> reiser4_sync_common+0x37/0x57
> Dec 26 17:40:49 localhost [<ffffffff802965b6>] do_fsync+0x52/0x88
> Dec 26 17:40:49 localhost [<ffffffff8029660f>] __do_fsync+0x23/0x36
> Dec 26 17:40:49 localhost [<ffffffff8020b76e>] system_call+0x7e/0x83
> Dec 26 17:40:49 localhost
> 
>>
>> /dev/root / reiser4
>> rw,atom_max_size=0x800,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10
>> 0 0
>>
>>
>> --- linux.0/fs/reiser4/reiser4.h        2007-12-28 16:30:59.000000000
>> -0600
>> +++ linux.1/fs/reiser4/reiser4.h        2007-12-28 16:31:40.000000000
>> -0600
>> @@ -197,7 +197,7 @@
>>
>>     Can be overwritten by optimal_io_size mount option.
>>  */
>> -#define REISER4_OPTIMAL_IO_SIZE (64 * 1024)
>> +#define REISER4_OPTIMAL_IO_SIZE (4096 * 1024)
>>
>>  /* see comments in inode.c:oid_to_uino() */
>>  #define REISER4_UINO_SHIFT (1 << 30)
>>
>>
>>
>>
>> butdiene wrote:
>> >
>> > Hi,
>> >
>> > the file contains several sysrq-t dumps when firefox hangs,
>> >
>> >  http://www.nabble.com/file/p14514445/reiser4-sysrq-t.txt.bz2
>> > reiser4-sysrq-t.txt.bz2
>> >
>> > thanks!
>> >
>>
>> --
>> View this message in context:
>> http://www.nabble.com/reiser4-firefox-hangs-due-to-fsync%2C-sysrq-t-dump-tp14514445p14533387.html
>> Sent from the ReiserFS - General mailing list archive at Nabble.com.
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> diff -urN linux-2.6.23-mm1-orig/fs/reiser4/super.h
> linux-2.6.23-mm1/fs/reiser4/super.h
> --- linux-2.6.23-mm1-orig/fs/reiser4/super.h	2007-12-29 19:53:04.837605194
> +0300
> +++ linux-2.6.23-mm1/fs/reiser4/super.h	2007-12-29 20:04:11.136691674
> +0300
> @@ -262,7 +262,7 @@
>  
>  	/* operations for objects on this file system */
>  	struct object_ops ops;
> -
> +	__u32 atom_max_nrpointers;
>  	/*
>  	 * structure to maintain d_cursors. See plugin/file_ops_readdir.c for
>  	 * more details
> diff -urN linux-2.6.23-mm1-orig/fs/reiser4/txnmgr.c
> linux-2.6.23-mm1/fs/reiser4/txnmgr.c
> --- linux-2.6.23-mm1-orig/fs/reiser4/txnmgr.c	2007-12-29
> 19:53:04.869613413 +0300
> +++ linux-2.6.23-mm1/fs/reiser4/txnmgr.c	2007-12-29 22:02:40.671070164
> +0300
> @@ -1235,6 +1235,30 @@
>  	    atom->txnh_count == atom->nr_waiters && atom_should_commit(atom);
>  }
>  
> +static void check_print_atom_nrpointers (txn_atom * atom)
> +{
> +	reiser4_super_info_data *sbinfo = get_current_super_private();
> +
> +	spin_lock_reiser4_super(sbinfo);
> +	if ((unsigned)atom_pointer_count(atom) > sbinfo->atom_max_nrpointers) {
> +		sbinfo->atom_max_nrpointers = atom_pointer_count(atom);
> +#if REISER4_DEBUG
> +		printk("edward-1555: atom %p has max_nr_pointers (%d), clean (%d),
> dirty (%d)\n",
> +		       atom, atom_pointer_count(atom), atom->clean, atom->dirty);
> +#else
> +		printk("edward-1555: atom %p has max_nr_pointers (%d)\n",
> +		       atom, atom_pointer_count(atom));
> +#endif
> +	}
> +	if (atom_is_committable(atom) &&
> +	    (unsigned)atom_pointer_count(atom) == sbinfo->atom_max_nrpointers) {
> +		printk("edward-1556: commit atom %p with max nrpointers %d\n",
> +		       atom, sbinfo->atom_max_nrpointers);
> +		dump_stack();
> +	}
> +	spin_unlock_reiser4_super(sbinfo);
> +}
> +
>  /* called periodically from ktxnmgrd to commit old atoms. Releases
> ktxnmgrd spin
>   * lock at exit */
>  int commit_some_atoms(txn_mgr * mgr)
> @@ -1264,6 +1288,7 @@
>  		 * first test without taking atom spin lock, whether it is
>  		 * eligible for committing at all
>  		 */
> +		check_print_atom_nrpointers(atom);
>  		if (atom_is_committable(atom)) {
>  			/* now, take spin lock and re-check */
>  			spin_lock_atom(atom);
> @@ -1683,7 +1708,7 @@
>  			   flusher */
>  			reiser4_atom_set_stage(cd->atom, ASTAGE_CAPTURE_WAIT);
>  			cd->atom->flags |= ATOM_FORCE_COMMIT;
> -
> +			check_print_atom_nrpointers(cd->atom);
>  			result =
>  			    commit_current_atom(&cd->nr_written, &cd->atom);
>  			if (result != 0 && result != -E_REPEAT)
> 
> 

-- 
View this message in context: http://www.nabble.com/reiser4-firefox-hangs-due-to-fsync%2C-sysrq-t-dump-tp14514445p14546580.html
Sent from the ReiserFS - General mailing list archive at Nabble.com.

