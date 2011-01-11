From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Negative blocks in rebuild-tree
Date: Tue, 11 Jan 2011 16:04:57 -0500
Message-ID: <4D2CC5F9.4040208@suse.com>
References: <4D28674A.60603@keff.org> <4D290828.8050304@gmail.com> <4D2A2B4D.9010906@suse.com> <4D2CAF0F.5070806@keff.org> <4D2CAFEF.8060309@suse.com> <4D2CB299.60703@keff.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000701020001000305080206"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D2CB299.60703@keff.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: sh@keff.org
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------000701020001000305080206
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/11/2011 02:42 PM, sh@keff.org wrote:
> Hmm. I don't think this is the same error I got the first time. Then it
> was something like '("pass_2: Reading of the block (%lu) failed on the
> device 0x%x\n"' (pass2.c).
> 
> Then I didn't run the fsck with -S.

Can you try to reproduce with the attached patch? Most of it are
formatting changes so the negative blocks (printed) will go away but
there are two signedness fixes in there that should help.

- -Jeff

> 
> On 01/11/11 20:30, Jeff Mahoney wrote:
>> On 01/11/2011 02:27 PM, sh@keff.org wrote:
>>> Hi
>>
>>> On 01/09/11 22:40, Jeff Mahoney wrote:
>>>> On 01/08/2011 07:58 PM, Edward Shishkin wrote:
>>>>> On 01/08/2011 02:31 PM, Sebastian Hyrwall wrote:
>>>>>> Hi
>>>>
>>>>> Hello.
>>>>
>>>>>>
>>>>>> I am getting a negative block-number with reiserfsck when doing
>>>>>> --rebuild-tree -S (or without -S). This causes a segmentation fault
>>>>>> later (pass 2) in the check because it tries to read a "non-existant
>>>>>> block". My rebuild takes 3 days and i didn't copy the stdout-info the
>>>>>> first time so I will post some more info as soon as it becomes available.
>>>>>>
>>>>>> Pass 0:
>>>>>> ####### Pass 0 #######
>>>>>> The whole partition (-710934672 blocks) is to be scanned
>>>>>> Skipping 117586 blocks (super block, journal, bitmaps)
>>>>
>>>>
>>>>> So you do have a ~16T partition. Correct?
>>>>
>>>>
>>>>>  -711052258 blocks
>>>>
>>>> This bit isn't bad typing - it's bad printf formatting. The actual bad
>>>> typing is going to be harder to track down. A quick look showed me some
>>>> signed block count variables in the debugreiserfs code but the fsck code
>>>> may be better off. I'll dig into it.
>>>>
>>>> Since you're trying to reproduce, it would be great if you capture the
>>>> core dump that should happen when you seg fault. Exact output would be
>>>> useful as well.
>>>>
>>>> -Jeff
>>>>
>>> Pass 1 (will try to insert 3472246 leaves):
>>> ####### Pass 1 #######
>>> Looking for allocable blocks .. finished
>>> 0%....20%^[[A....40%....60%..bc ..80%....100%
>>> left 0, 62 /sec
>>> Flushing..finished
>>>         3472246 leaves read
>>>                 3457984 inserted
>>>                         - pointers in indirect items pointing to
>>> metadata 77 (zeroed)
>>>                 14262 not inserted
>>>         non-unique pointers in indirect items (zeroed) 71213
>>> ####### Pass 2 #######
>>
>>> Pass 2:
>>> 0%bread: Cannot read the block (18446744072169358012): (Invalid
>>> argument). /sec
>>> bread: Cannot read the block (18446744072169358012): (Invalid argument).
>>
>>> gdb
>>
>>> Program received signal SIGSEGV, Segmentation fault.
>>> 0x000000000042008b in ?? ()
>>
>>> ---
>>> 18446744072169358012 is pretty close to an unsigned int64.
>>
>> This looks like a signed int got sign extended to a long.
>>
>>> The coredmp is 1.7GB so I will upload that somewhere soon.. :)
>>
>> I don't need the whole core dump for now. Can you load up gdb and do:
>>
>> gdb reiserfsck core
>>
>> (gdb) bt -full
>>
>> .. and send the results?
>>
>> Thanks.
>>
>> -Jeff
>>
>>
>>
>>
>>>>
>>>>>> will be read
>>>>>>
>>>>>> Does anyone have any idea on how to fix this?
>>>>>>
>>>>>> On a 64-bit system.
>>>>
>>>>
>>>>> It looks like you have encountered an overflow/truncation fsck bug
>>>>> specific to giant volumes.
>>>>
>>>>> I would first ask Jeff: AFAIK he is planning to enable 16T files
>>>>> in reiserfs.
>>>>> Jeff, do you have any non-published fixups for such problems?
>>>>
>>>>> Thanks,
>>>>> Edward.
>>>>
>>>>
>>>>>>
>>>>>> Sincerely,
>>>>>> Sebastian H
>>>>>> -- 
>>>>>> To unsubscribe from this list: send the line "unsubscribe
>>>>>> reiserfs-devel" in
>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>>
>>>>
>>>>
>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAk0sxfkACgkQLPWxlyuTD7KlMACfUschi1wXFAGZUXiXSJuF5Z1h
FSMAn1/saYInkC4LdZvZqM74zsqV+1s0
=OM5X
-----END PGP SIGNATURE-----

--------------000701020001000305080206
Content-Type: text/plain;
 name="signedness-fixes"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="signedness-fixes"

---
 debugreiserfs/debugreiserfs.c |   18 +++++++++---------
 debugreiserfs/pack.c          |   18 +++++++++---------
 debugreiserfs/stat.c          |    2 +-
 fsck/check_tree.c             |    6 +++---
 fsck/pass0.c                  |   10 +++++-----
 fsck/pass1.c                  |    4 ++--
 lib/io.c                      |    2 +-
 reiserfscore/journal.c        |    2 +-
 reiserfscore/reiserfslib.c    |    5 +++--
 reiserfscore/stree.c          |    2 +-
 10 files changed, 35 insertions(+), 34 deletions(-)

--- a/debugreiserfs/debugreiserfs.c
+++ b/debugreiserfs/debugreiserfs.c
@@ -59,11 +59,11 @@ Options:\n\
 
 #if 1
 struct reiserfs_fsstat {
-    int nr_internals;
-    int nr_leaves;
-    int nr_files;
-    int nr_directories;
-    int nr_unformatted;
+    unsigned int nr_internals;
+    unsigned int nr_leaves;
+    unsigned int nr_files;
+    unsigned int nr_directories;
+    unsigned int nr_unformatted;
 } g_stat_info;
 #endif
 
@@ -465,7 +465,7 @@ static void init_bitmap (reiserfs_filsys
     case ALL_BLOCKS:
 	    input_bitmap (fs) = reiserfs_create_bitmap (block_count);
 	    reiserfs_bitmap_fill (input_bitmap (fs));
-	    reiserfs_warning (stderr, "Whole device (%d blocks) is to be scanned\n", 
+	    reiserfs_warning (stderr, "Whole device (%u blocks) is to be scanned\n",
 			      reiserfs_bitmap_ones (input_bitmap (fs)));	
 	    break;
     case USED_BLOCKS:
@@ -494,7 +494,7 @@ static void init_bitmap (reiserfs_filsys
 		    reiserfs_exit (1, "could not load fitmap from \"%s\"", 
 				   input_bitmap_file_name(fs));
 	    }
-	    reiserfs_warning (stderr, "%d blocks marked in the given bitmap\n",
+	    reiserfs_warning (stderr, "%u blocks marked in the given bitmap\n",
 			      reiserfs_bitmap_ones (input_bitmap (fs)));
 	    fclose (fp);
 	    break;
@@ -554,8 +554,8 @@ static void do_dump_tree (reiserfs_filsy
 	    }
 
 	    /* print the statistic */
-	    printf ("\t%d internal + %d leaves + %d "
-		    "unformatted nodes = %d blocks\n", 
+	    printf ("\t%u internal + %u leaves + %u "
+		    "unformatted nodes = %u blocks\n",
 		    g_stat_info.nr_internals,   g_stat_info.nr_leaves, 
 		    g_stat_info.nr_unformatted, g_stat_info.nr_internals + 
 		    g_stat_info.nr_leaves + g_stat_info.nr_unformatted);
--- a/debugreiserfs/pack.c
+++ b/debugreiserfs/pack.c
@@ -8,7 +8,7 @@
 
 
 /* counters for each kind of blocks */
-int packed,
+unsigned int packed,
     packed_leaves,
     full_blocks,
     having_ih_array, /* blocks with broken block head */
@@ -638,7 +638,7 @@ static void pack_frozen_data (reiserfs_f
     }
     reiserfs_warning (stderr, "ok\n");fflush (stderr);
     reiserfs_warning (stderr, 
-		      "Super block, bitmaps, journal - %d blocks - done, %d blocks left\n",
+		      "Super block, bitmaps, journal - %u blocks - done, %u blocks left\n",
 		      packed, reiserfs_bitmap_ones (what_to_pack));
 }
 
@@ -693,13 +693,13 @@ void pack_partition (reiserfs_filsys_t *
     magic16 = END_MAGIC;
     fwrite_le16 (&magic16);
 
-    fprintf (stderr, "\nPacked %d blocks:\n"
-	     "\tcompessed %d\n"
-	     "\tfull blocks %d\n"
-	     "\t\tleaves with broken block head %d\n"
-	     "\t\tcorrupted leaves %d\n"
-	     "\t\tinternals %d\n"
-	     "\t\tdescriptors %d\n",
+    fprintf (stderr, "\nPacked %u blocks:\n"
+	     "\tcompessed %u\n"
+	     "\tfull blocks %u\n"
+	     "\t\tleaves with broken block head %u\n"
+	     "\t\tcorrupted leaves %u\n"
+	     "\t\tinternals %u\n"
+	     "\t\tdescriptors %u\n",
 	     packed,
 	     packed_leaves, full_blocks, having_ih_array,
 	     bad_leaves, internals, descs);
--- a/debugreiserfs/stat.c
+++ b/debugreiserfs/stat.c
@@ -245,7 +245,7 @@ void do_stat (reiserfs_filsys_t * fs)
 	reiserfs_exit (1, "could not open %s to save bitmap: %m\n",
 		       input_bitmap_file_name(fs));
     }
-    reiserfs_warning (stderr, "Updated bitmap contains %d blocks marked\n",
+    reiserfs_warning (stderr, "Updated bitmap contains %u blocks marked\n",
 		      reiserfs_bitmap_ones (input_bitmap (fs)));
     
     reiserfs_bitmap_save (fp, input_bitmap (fs));
--- a/fsck/check_tree.c
+++ b/fsck/check_tree.c
@@ -119,7 +119,7 @@ static int is_block_free (reiserfs_filsy
 }
 
 
-/*static int hits = 0;*/
+/*static unsigned int hits = 0;*/
 
 /* we have seen this block in the tree, mark corresponding bit in the
    control bitmap */
@@ -156,7 +156,7 @@ static void init_control_bitmap (reiserf
     for (i = 0; i <= fs->fs_super_bh->b_blocknr; i ++)
     	we_met_it (i);
 
-    /*printf ("SKIPPED: %d blocks marked used (%d)\n", hits, 
+    /*printf ("SKIPPED: %u blocks marked used (%d)\n", hits,
               reiserfs_bitmap_zeros (control_bitmap));
       hits = 0;*/
 
@@ -172,7 +172,7 @@ static void init_control_bitmap (reiserf
 	    block ++;	
     }
     
-    /*printf ("BITMAPS: %d blocks marked used (%d)\n", hits, 
+    /*printf ("BITMAPS: %u blocks marked used (%d)\n", hits,
 	      reiserfs_bitmap_zeros (control_bitmap));
 	      
       hits = 0;*/
--- a/fsck/pass0.c
+++ b/fsck/pass0.c
@@ -1759,7 +1759,7 @@ static void init_source_bitmap (reiserfs
     case ALL_BLOCKS:
 	fsck_source_bitmap (fs) = reiserfs_create_bitmap (block_count);
 	reiserfs_bitmap_fill (fsck_source_bitmap (fs));
-	fsck_progress ("The whole partition (%d blocks) is to be scanned\n", 
+	fsck_progress ("The whole partition (%u blocks) is to be scanned\n",
 		       reiserfs_bitmap_ones (fsck_source_bitmap (fs)));	
 	break;
 
@@ -1768,7 +1768,7 @@ static void init_source_bitmap (reiserfs
 	fsck_source_bitmap (fs) = reiserfs_create_bitmap (block_count);	
 	reiserfs_bitmap_copy (fsck_source_bitmap (fs), fs->fs_bitmap2);
 	
-	fsck_progress ("ok, %d blocks marked used\n", 
+	fsck_progress ("ok, %u blocks marked used\n",
 		       reiserfs_bitmap_ones (fsck_source_bitmap (fs)));
 	break;
 
@@ -1787,7 +1787,7 @@ static void init_source_bitmap (reiserfs
 			   fsck_data (fs)->rebuild.bitmap_file_name);
 	}
 
-	fsck_progress ("%d blocks marked used in extern bitmap\n", 
+	fsck_progress ("%u blocks marked used in extern bitmap\n",
 		       reiserfs_bitmap_ones (fsck_source_bitmap (fs)));
 	fclose (fp);
 	break;
@@ -1863,8 +1863,8 @@ static void init_source_bitmap (reiserfs
 
     fsck_source_bitmap (fs)->bm_set_bits = reiserfs_bitmap_ones (fsck_source_bitmap (fs));
 
-    fsck_progress ("Skipping %d blocks (super block, journal, "
-		   "bitmaps) %d blocks will be read\n", tmp, fsck_source_bitmap (fs)->bm_set_bits);
+    fsck_progress ("Skipping %u blocks (super block, journal, "
+		   "bitmaps) %u blocks will be read\n", tmp, fsck_source_bitmap (fs)->bm_set_bits);
 		
 }
 
--- a/fsck/pass1.c
+++ b/fsck/pass1.c
@@ -646,8 +646,8 @@ void load_pass_1_result (FILE * fp, reis
     fetch_objectid_map (proper_id_map (fs), fs);
     */
 
-    fsck_progress ("Pass 1 result loaded. %d blocks used, %d allocable, "
-		   "still to be inserted %d\n",
+    fsck_progress ("Pass 1 result loaded. %u blocks used, %u allocable, "
+		   "still to be inserted %u\n",
 		   reiserfs_bitmap_ones (fsck_new_bitmap (fs)),
 		   reiserfs_bitmap_zeros (fsck_allocable_bitmap (fs)),
 		   reiserfs_bitmap_zeros (fsck_uninsertables (fs)));
--- a/lib/io.c
+++ b/lib/io.c
@@ -628,7 +628,7 @@ void close_rollback_file () {
             return;
         fwrite (&rollback_blocks_number, sizeof (rollback_blocksize), 1, s_rollback_file);
         if (log_file != 0) 
-            fprintf (log_file, "rollback: %d blocks backed up\n", rollback_blocks_number);
+            fprintf (log_file, "rollback: %u blocks backed up\n", rollback_blocks_number);
     }
         
     fclose (s_rollback_file);
--- a/reiserfscore/journal.c
+++ b/reiserfscore/journal.c
@@ -577,7 +577,7 @@ int reiserfs_create_journal(
 	{
 	    /* host device does not contain enough blocks */
 	    reiserfs_warning (stderr, "reiserfs_create_journal: cannot create "
-		"a journal of %lu blocks with %lu offset on %d blocks\n", 
+		"a journal of %lu blocks with %lu offset on %u blocks\n",
 		len, offset, get_sb_block_count(sb));
 		return 0;
 	}
--- a/reiserfscore/reiserfslib.c
+++ b/reiserfscore/reiserfslib.c
@@ -59,7 +59,8 @@ reiserfs_filsys_t * reiserfs_open (char
     reiserfs_filsys_t * fs;
     struct buffer_head * bh;
     struct reiserfs_super_block * sb;
-    int fd, i;
+    int fd;
+    unsigned int i;
 
     /* convert root dir key and parent root dir key to little endian format */
     make_const_keys ();
@@ -200,7 +201,7 @@ reiserfs_filsys_t * reiserfs_create (cha
 	block_size, block_count, 0)) 
     {
 	reiserfs_warning (stderr, "reiserfs_create: can not create that small "
-	    "(%d blocks) filesystem\n", block_count);
+	    "(%u blocks) filesystem\n", block_count);
 	return 0;
     }
 
--- a/reiserfscore/stree.c
+++ b/reiserfscore/stree.c
@@ -313,7 +313,7 @@ int search_by_key (reiserfs_filsys_t * f
 		   int  n_stop_level)   /* How far down the tree to search.*/
 {
     struct reiserfs_super_block * sb;
-    int n_block_number,
+    unsigned int n_block_number,
 	expected_level,
 	n_block_size    = fs->fs_blocksize;
     struct buffer_head  *       p_s_bh;

--------------000701020001000305080206--
