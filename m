From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Tue, 20 Jul 2004 03:31:30 -0500
Message-ID: <20040720083108.73C4C15DCA@mail03.powweb.com>
References: <40FCC497.40308@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FCC497.40308@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

> 
> Hans Reiser wrote:
> | David Masover wrote:
> |
> |> Why beyond?  Ask each fs object (without knowing its name), "What is
> |> your primary type?"  Put like-typed objects together.  Simple.
> |
> | Except that at look up time all you know is the name, and if the type is
> | not in the name then you cannot fibrate by it.
> 
> I must not understand fibration.  Do you have to know the fibration of
> an object to find it?
> 

Fibration is simply a means to physically group together filesystem objects
you want grouped together, or perhaps more likely, separated from some other
group. I muddied the waters by proposing that the fibration bits might be
gainfully employed as a quick and dirty to test whether an object had a
particular extension. 

Here is the schematic for directory item keys with which you are probably
familiar. The file /etc/foo will have the dirid for /etc as key.el[0], the
first 7 characters of the file name in key.el[1]. etc. Fibration, if
enabled, assigns a 'fibre' as the 7 high bits of the second key element,
thus acting like 'GROUP BY' for those file names that end up generating the
same fibre bits using the configured fibration plugin. See below.

David


/*
*   KEY ASSIGNMENT: PLAN A, LONG KEYS.
*
* DIRECTORY ITEMS
*
|       60     | 4 | 7 |1|   56        |        64        |        64
+--------------+---+---+-+-------------+------------------+----------------+
|    dirid     | 0 | F |H|  prefix-1   |    prefix-2      |  prefix-3/hash |
+--------------+---+---+-+-------------+------------------+----------------+
|                  |                   |                  |                |
|    8 bytes       |      8 bytes      |     8 bytes      |     8 bytes    |


 dirid         objectid of directory this item is for

 F             fibration, see fs/reiser4/plugin/fibration.[ch] (BELOW)

 H             1 if last 8 bytes of the key contain hash,
               0 if last 8 bytes of the key contain prefix-3

 prefix-1      first 7 characters of file name.
               Padded by zeroes if name is not long enough.

 prefix-2      next 8 characters of the file name.

 prefix-3      next 8 characters of the file name.

 hash          hash of the rest of file name (i.e., portion of file
               name not included into prefix-1 and prefix-2).

 File names shorter than 23 (== 7 + 8 + 8) characters are completely encoded
 in the key. Such file names are called "short". They are distinguished by H
 bit set in the key.

 Other file names are "long". For long name, H bit is 0, and first 15 (== 7
 + 8) characters are encoded in prefix-1 and prefix-2 portions of the
 key. Last 8 bytes of the key are occupied by hash of the remaining
 characters of the name.

 This key assignment reaches following important goals:

     (1) directory entries are sorted in approximately lexicographical
     order.

     (2) collisions (when multiple directory items have the same key), while
     principally unavoidable in a tree with fixed length keys, are rare.


/***************************** fibration.c ****************************/
/* Copyright 2004 by Hans Reiser, licensing governed by
 * reiser4/README */

/*
 * Suppose we have a directory tree with sources of some project. During
 * compilation .o files are created within this tree. This makes access
 * to the original source files less efficient, because source files are
 * now "diluted" by object files: default directory plugin uses prefix
 * of a file name as a part of the key for directory entry (and this
 * part is also inherited by the key of file body). This means that
 * foo.o will be located close to foo.c and foo.h in the tree.
 *
 * To avoid this effect directory plugin fills highest 7 (unused
 * originally) bits of the second component of the directory entry key
 * by bit-pattern depending on the file name (see
 * fs/reiser4/kassign.c:build_entry_key_common()). These bits are called
 * "fibre". Fibre of the file name key is inherited by key of stat data
 * and keys of file body (in the case of REISER4_LARGE_KEY).
 *
 * Fibre for a given file is chosen by per-directory fibration
 * plugin. Names within given fibre are ordered lexicographically.
 */

static const int fibre_shift = 57;

#define FIBRE_NO(n) (((__u64)(n)) << fibre_shift)

/*
 * Trivial fibration: all files of directory are just ordered
 * lexicographically.
 */
static __u64 fibre_trivial(const struct inode *dir, const char *name, int
len)
{
	return FIBRE_NO(0);
}

/*
 * dot-o fibration: place .o files after all others.
 */
static __u64 fibre_dot_o(const struct inode *dir, const char *name, int len)
{
	/* special treatment for .*\.o */
	if (len > 2 && name[len - 1] == 'o' && name[len - 2] == '.')
		return FIBRE_NO(1);
	else
		return FIBRE_NO(0);
}

/*
 * ext.1 fibration: subdivide directory into 128 fibrations one for each
 * 7bit extension character (file "foo.h" goes into fibre "h"), plus
 * default fibre for the rest.
 */
static __u64 fibre_ext_1(const struct inode *dir, const char *name, int len)
{
	if (len > 2 && name[len - 2] == '.')
		return FIBRE_NO(name[len - 1]);
	else
		return FIBRE_NO(0);
}

/*
 * ext.3 fibration: try to separate files with different 3-character
 * extensions from each other.
 */
static __u64 fibre_ext_3(const struct inode *dir, const char *name, int len)
{
	if (len > 4 && name[len - 4] == '.')
		return FIBRE_NO(name[len - 3] + name[len - 2] + name[len -
1]);
	else
		return FIBRE_NO(0);
}



