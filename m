From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: /proc/fs/reiserfs question
Date: Mon, 14 Oct 2002 18:25:19 +0400
Message-ID: <15786.54223.785138.49029@laputa.namesys.com>
References: <20021014160435.344ca55b.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021014160435.344ca55b.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Philippe =?ISO-8859-1?B?R3JhbW91bGzp?= <philippe.gramoulle@mmania.com>
Cc: reiserfs <reiserfs-list@namesys.com>

Philippe Gramoull=E9 writes:
 > Hi,
 >=20
 > Is there any documentation that gives the description for each line=20
 > of each file in /proc/fs/reiserfs/sd(x,x)/*
 >=20
 > like what is the meaning of s_fix_nodes ? etc..

I am afraid one has to dig it out of the sources. Here is description of
some fields displayed in "super", they pertain to the in-core
super-block:

			"state": REISERFS_VALID_FS/REISERFS_ERROR_FS

			"mount options": options given to mount

			"gen. counter": file system "generation acounter"---this is
			incremented with each balancing.

			"s_kmallocs": how many kmallocs (calls to general purpose
			kernel memory allocator) were performed by reiserfs code

			"s_disk_reads": not maintained

			"s_disk_writes": not maintained

			"s_fix_nodes": how many time "fix-nodes" (1st phase of
			balancing) was performed.

			"s_do_balance": how many times "do-balance" (2nd phase of
			balancing) was performed

			"s_unneeded_left_neighbor": not maintained

			"s_good_search_by_key_reada": not maintained

			"s_bmaps": not maintained

			"s_bmaps_without_search": not maintained

			"s_direct2indirect": how many direct->indirect converions
			were performed

			"s_indirect2direct": how many indirect->direct converions
			were performed

			"max_hash_collisions": maximal hash collision met so far.

			"breads": not maintained

			"bread_misses": not maintained

			"search_by_key": how many times search_by_key (main tree
			traversal routine) was called.

			"search_by_key_fs_changed": how many times search_by_key was
			performed concurrently to balancing.

			"search_by_key_restarted": how many times search_by_key had
			to restart due to concurrent balancing.

			"insert_item_restarted"-------+
			"paste_into_item_restarted"   +
			"cut_from_item_restarted"     +-> how many times particular
			"delete_solid_item_restarted" +   balancing operation had to
			"delete_item_restarted"-------+   restart

			"leaked_oid": how many object-ids (unique identifiers
			assigned to files) were missed

			"leaves_removable": how many times three leaf nodes of the
			balanced tree were mergeable into one

I guess we should keep this information somewhere on the web-site. If
you need more detailed info, let me know.

 >=20
 > Thanks much,
 >=20
 > Philippe.

Nikita.
