From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiserfs: implement basic reiserfs 3.7
Date: Tue, 30 Nov 2010 03:11:05 +0100
Message-ID: <4CF45D39.5030700@gmail.com>
References: <4CE7F21B.4050605@suse.com> <4CF07C63.40408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KMAhH94ULnlgRyDSM0AcsTKOZsP/VYPkCG7BRN3a6bA=;
        b=qToOMOjBQaLAbe9Za72wcbpNbfTfBGOOMoTUNo0bz75JhnH+PfLZK5oaZf9WchxqVL
         aqbcymAeeauQqI0DSEVR77iRCVtdNAqcKoKQTBReh/5dA/KiyQpPtwWC3jJRFTw8hnJ+
         ZYHjbAieuxd8qPx951uyhBDQfShc5N/IxsmRU=
In-Reply-To: <4CF07C63.40408@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Edward Shishkin wrote:
> Jeff Mahoney wrote:
>   
>>  This patch contains the basic implementation for reiserfs 3.7.
>>
>>  Specifically, it extends reiserfs 3.6 to allow feature compatibility bits.
>>  Since it extends v3.6, it assumes allowing a nonstandard journal, so some
>>  paths have been adjusted to test for a nonstandard journal instead of
>>  just having the JR superblock magic.
>>
>>  I don't have any large plans to extend beyond some very basic features,
>>  although extended attributes would be much more efficiently implemented
>>  if they were first class items instead of hidden files.
>>
>>  The next patch in the series adds support to allow v2 stat data items
>>  to describe the number of blocks in fs-blocksize blocks instead of
>>  512 byte blocks.
>>
>> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
>> ---
>>  fs/reiserfs/journal.c          |    2 
>>  fs/reiserfs/prints.c           |    6 +
>>  fs/reiserfs/procfs.c           |    4 -
>>  fs/reiserfs/super.c            |  140 ++++++++++++++++++++++++++++++++++++++++-
>>  include/linux/magic.h          |    1 
>>  include/linux/reiserfs_fs.h    |   11 ++-
>>  include/linux/reiserfs_fs_sb.h |   39 +++++++++++
>>  7 files changed, 196 insertions(+), 7 deletions(-)
>>
>> --- a/fs/reiserfs/journal.c
>> +++ b/fs/reiserfs/journal.c
>> @@ -2850,7 +2850,7 @@ int journal_init(struct super_block *sb,
>>  	jh = (struct reiserfs_journal_header *)(bhjh->b_data);
>>  
>>  	/* make sure that journal matches to the super block */
>> -	if (is_reiserfs_jr(rs)
>> +	if (has_nonstandard_journal(rs)
>>   
>>     
>
> Nup.
> Should be:
> if ((is_reiserfs_jr(rs) || is_reiserfs_3_7)
>   

I was wrong here: this should be untouched

>   
>>  	    && (le32_to_cpu(jh->jh_journal.jp_journal_magic) !=
>>  		sb_jp_journal_magic(rs))) {
>>  		reiserfs_warning(sb, "sh-460",
>> --- a/fs/reiserfs/prints.c
>> +++ b/fs/reiserfs/prints.c
>> @@ -532,6 +532,8 @@ static int print_super_block(struct buff
>>  	} else if (is_reiserfs_jr(rs)) {
>>  		version = ((sb_version(rs) == REISERFS_VERSION_2) ?
>>  			   "3.6" : "3.5");
>> +	} else if (is_reiserfs_3_7(rs)) {
>> +		version = "3.7";
>>  	} else {
>>  		return 1;
>>  	}
>> @@ -547,12 +549,12 @@ static int print_super_block(struct buff
>>  //    skipped = (bh->b_blocknr * bh->b_size) / sb_blocksize(rs);
>>  	skipped = bh->b_blocknr;
>>  	data_blocks = sb_block_count(rs) - skipped - 1 - sb_bmap_nr(rs) -
>> -	    (!is_reiserfs_jr(rs) ? sb_jp_journal_size(rs) +
>> +	    (!has_nonstandard_journal(rs) ? sb_jp_journal_size(rs) +
>>   
>>     
> ditto
>
>   
>>  	     1 : sb_reserved_for_journal(rs)) - sb_free_blocks(rs);
>>  	printk
>>  	    ("Busy blocks (skipped %d, bitmaps - %d, journal (or reserved) blocks - %d\n"
>>  	     "1 super block, %d data blocks\n", skipped, sb_bmap_nr(rs),
>> -	     (!is_reiserfs_jr(rs) ? (sb_jp_journal_size(rs) + 1) :
>> +	     (!has_nonstandard_journal(rs) ? (sb_jp_journal_size(rs) + 1) :
>>   
>>     
> ditto
>   
>>  	      sb_reserved_for_journal(rs)), data_blocks);
>>  	printk("Root block %u\n", sb_root_block(rs));
>>  	printk("Journal block (first) %d\n", sb_jp_journal_1st_block(rs));
>> --- a/fs/reiserfs/procfs.c
>> +++ b/fs/reiserfs/procfs.c
>> @@ -28,7 +28,9 @@ static int show_version(struct seq_file
>>  {
>>  	char *format;
>>  
>> -	if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_6)) {
>> +	if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_7)) {
>> +		format = "3.7";
>> +	} else if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_6)) {
>>  		format = "3.6";
>>  	} else if (REISERFS_SB(sb)->s_properties & (1 << REISERFS_3_5)) {
>>  		format = "3.5";
>> --- a/fs/reiserfs/super.c
>> +++ b/fs/reiserfs/super.c
>> @@ -35,6 +35,7 @@ struct file_system_type reiserfs_fs_type
>>  static const char reiserfs_3_5_magic_string[] = REISERFS_SUPER_MAGIC_STRING;
>>  static const char reiserfs_3_6_magic_string[] = REISER2FS_SUPER_MAGIC_STRING;
>>  static const char reiserfs_jr_magic_string[] = REISER2FS_JR_SUPER_MAGIC_STRING;
>> +static const char reiserfs_3_7_magic_string[] = REISERFS_37_SUPER_MAGIC_STRING;
>>  
>>  int is_reiserfs_3_5(struct reiserfs_super_block *rs)
>>  {
>> @@ -48,6 +49,12 @@ int is_reiserfs_3_6(struct reiserfs_supe
>>  			strlen(reiserfs_3_6_magic_string));
>>  }
>>  
>> +int is_reiserfs_3_7(struct reiserfs_super_block *rs)
>> +{
>> +	return !strncmp(rs->s_v1.s_magic, reiserfs_3_7_magic_string,
>> +			strlen(reiserfs_3_7_magic_string));
>> +}
>> +
>>  int is_reiserfs_jr(struct reiserfs_super_block *rs)
>>  {
>>  	return !strncmp(rs->s_v1.s_magic, reiserfs_jr_magic_string,
>> @@ -57,7 +64,13 @@ int is_reiserfs_jr(struct reiserfs_super
>>  static int is_any_reiserfs_magic_string(struct reiserfs_super_block *rs)
>>  {
>>  	return (is_reiserfs_3_5(rs) || is_reiserfs_3_6(rs) ||
>> -		is_reiserfs_jr(rs));
>> +		is_reiserfs_3_7(rs) || is_reiserfs_jr(rs));
>> +}
>> +
>> +int has_nonstandard_journal(struct reiserfs_super_block *rs)
>> +{
>> +	return is_reiserfs_jr(rs) ||
>> +	       (is_reiserfs_3_7(rs) && rs->s_v1.s_journal.jp_journal_dev);
>>  }
>>  
>>   
>>     
>
>   

Actualy this is the same as is_reiserfs_jr(rs), just because
(is_reiserfs_3_7(rs) && rs->s_v1.s_journal.jp_journal_dev)
is always false, so let's better avoid this stuff..

> Actually the function above is brain damaged.
> Journal is non-standard _iff_ it is "relocated" or has length (excluding
> journal
> header) different from 8192. So it can happen that a partition is "jr" (with
> REISER2FS_JR_SUPER_MAGIC_STRING), but has _standard_ journal.
>
>
>   
>>  static int reiserfs_remount(struct super_block *s, int *flags, char *data);
>> @@ -1397,6 +1410,10 @@ static int read_super_block(struct super
>>  					 "non-standard magic", sb_version(rs));
>>  			return 1;
>>  		}
>> +	} else if (is_reiserfs_3_7(rs)) {
>> +		reiserfs_info(s, "found reiserfs format \"3.7\" "
>> +			      "with %sstandard journal\n",
>> +			      sb_jp_journal_dev(rs) ? "non-" : "");
>>  	} else
>>  		/* s_version of standard format may contain incorrect information,
>>  		   so we just look at the magic string */
>> @@ -1404,6 +1421,7 @@ static int read_super_block(struct super
>>  			      "found reiserfs format \"%s\" with standard journal\n",
>>  			      is_reiserfs_3_5(rs) ? "3.5" : "3.6");
>>  
>>   
>>     
>
>   

