From: Troy Wu <troy@sequence.stanford.edu>
Subject: weird symlink problem persists...
Date: Mon, 16 Sep 2002 23:07:51 -0700 (PDT)
Message-ID: <Pine.LNX.4.44L1.0209162228450.13963-100000@sequence.stanford.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11486-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS at NameSys <reiserfs-list@namesys.com>
Cc: NFS at SourceForge <NFS@lists.sourceforge.net>

I'm using the nfs-utils-1.0.1 tools on a 2.4.10 kernel (relatively stock
SuSE-7.3 kernel) with ReiserFS 3.6.25 (but using the 3.5.x disk format).

On the machine which is the NFS client, I create a symlink from a file in
mount point A to a location in mount point B (i.e., I am cd'ed into a
directory in mount point B, and the link source is a file under mount
point A):

 ln -s /vol/assembly/crypto/scaffolds/vbc5/edit_dir/vbc5-all.screen.out .

When I do 'ls -l':

lrwxrwxrwx    1 troy     genome       1351 Sep 16 22:28 vbc5-all.screen.out ->
/vol/assembly/crypto/scaffolds/vbc5/edit_dir/vbc5-all.screen.out??_dir/1029000H12.x123_GCNLT08.phd.2:
0 subs from T TRIM (820)?WRITING
/vol/assembly/1029/new_files/phd_dir/1029000H12.x123_GCNLT08.phd.2?DIR
/vol/assembly/1029?      chromat_dir:   1316 files (40%)    (64%)?
ecoli:      1 files ( 0%)    ( 0%)?         edit_dir:      8 files ( 0%)
( 0%)?          m13_dir:     70 files ( 2%)    ( 3%)?      mal_chromat:
140 files ( 4%)    ( 7%)?     missing_data:   1245 files (38%)?
ribo:      1 files ( 0%)    ( 0%)?              seq:    507 files (15%)
(25%)?-----------------------------------------------?      TOTAL FILES:
3288 files     2043 files??cneo_newfiles??PROJECT 1029 LABEL
Sep-16-2002??PATH /vol*y 68 68 68 68 68?68 68 68 68 68 68 68 68 68 68 68
68 68 68 68 68 68?68 68 68 68 68 68 68 68 68 68 68 68 68 68 68 68 68?68 68
68 68 68 57 57 68 68 68 68 68 68 68 68 68 68?68 68 68 68 57 57 57 59 59 59
68 68 68 68 68 68 68?68 68 68 68 68 68 68 68 68 57 57 57 68 68 68 68 68?68
68 68 68 68 57 57 68 68 68 68 68 68 57 57 57 68?68 68 68 68 68 68 68 68 68
68 68 62 62 68 68 68 68?68 68 68 68 68 68 68 68 68 68 68 68 68 68 68 68
68?68 68 68 68 68 68 68 68 68 68 68 68 68 68 68 68 68?68 68 68 68 68 68 68
68 68 68 68 68 68 68 62 62 62?62 62 62 62 62 68
68??*????6?W-????]?W?&??`?N?4???,??????i???lS ?!??)??????+rY?

			*	*	*

I read in an earlier post that this is a problem in the kernel sources:

	fs/nfsd/nfs*xdr.c:decode_pathname()

    >> Yes. It had nothing to do with Reiserfs, or the NFS client and
    >> everything to do with Neil using the function
    >> xdr_decode_string_inplace() in
    >> fs/nfsd/nfs*xdr.c:decode_pathname().
    >>
    >> Just replace with xdr_decode_string(), and all should be well.

But, my version of the kernel has this for decode_pathname():

--

static inline u32 *
decode_pathname(u32 *p, char **namp, int *lenp)
{
        char            *name;
        int             i;

        if ((p = xdr_decode_string(p, namp, lenp, NFS3_MAXPATHLEN)) != NULL) {
                for (i = 0, name = *namp; i < *lenp; i++, name++) {
                        if (*name == '\0')
                                return NULL;
                }
        }

        return p;
}

--

That is, I think my version of the kernel already has the relevant 'fix.'
Also, not every file is susceptible to this disease, but many are.

Can someone help me understand what the problem is?  Removing the link and
making it again changes the link garbage (e.g., the link name contains
pieces of /etc/printcap, /etc/profile, and ~/.cshrc)!  Sometimes, I can
even get the contents of files which I don't own (!) appended to the
actual source file link name!!

			*	*	*

I've done some testing to see if this is related to file length.  Here's
what I've found.  Starting with a filename that is 1 character long, I
created filenames up to 200 characters long.  Starting with the first file
(of filename length 1), I get crap in the link name (which is usually the
correct link source filename plus 2 question marks) every fifth file;
i.e., when the filename length is 4n+1, the link become corrupt.

	Very, VERY, reproducible.

I started noticing this problem on the NFS client (a OSF/1 box) started
rebooting because it couldn't handle the ridiculously long filenames!
I'll provide as much information as necessary for anyone who can fix this
problem.

	--troy

