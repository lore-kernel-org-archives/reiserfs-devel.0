From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfstune: block allocator is not defined
Date: Fri, 21 Oct 2005 19:12:56 +0400
Message-ID: <200510211912.56493.vitaly@namesys.com>
References: <43583531.3040105@muenning.com> <4358AA5B.7000803@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_4VQWD5VtM1F6KuO"
Return-path: <reiserfs-list-return-26600-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4358AA5B.7000803@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Konstantin =?iso-8859-1?q?M=FCnning?= <konstantin@muenning.com>
Cc: reiserfs-list@namesys.com

--Boundary-00=_4VQWD5VtM1F6KuO
Content-Type: text/plain; charset="windows-1251"
Content-Transfer-Encoding: base64
Content-Disposition: inline

SGksCgp0cnkgdGhlIGF0dGFjaGVkIHBhdGNoIHBsZWFzZS4KCk9uIEZyaWRheSAyMSBPY3RvYmVy
IDIwMDUgMTI6NDQsIFZsYWRpbWlyIFYuIFNhdmVsaWV2IHdyb3RlOgo+IEhlbGxvCj4gCj4gS29u
c3RhbnRpbiBN/G5uaW5nIHdyb3RlOgo+ID4gSGkhCj4gPiAKPiA+IEp1c3QgdHJpZWQgdG8gYWRk
IHNvbWUgYmFkYmxvY2tzIGxpa2UgdGhpczoKPiA+IAo+ID4gcmVpc2VyZnN0dW5lIC1iIC90bXAv
YmFkYmxvY2tsaXN0IC9kZXYvaGRhNQo+ID4gCj4gPiBhbmQgSSBnZXQgdGhlIGVycm9yOgo+ID4g
Cj4gPiAKPiA+IGJsb2NrIGFsbG9jYXRvciBpcyBub3QgZGVmaW5lZAo+ID4gCj4gPiBBYm9ydGVk
Cj4gPiAKPiA+IAo+ID4gVGhlIHNhbWUgd2hlbiBJIHRyeSBpdCB3aXRoIC1CLiBBcyB0aGlzIG1l
c3NhZ2UgbWVhbnMgbm90aGluZyB0byBtZSwgaGFzCj4gPiBzb21lYm9keSBhbnkgaWRlYSB3aGF0
IHRoZSBwcm9ibGVtIG1pZ2h0IGJlPyBUaGUgbWFuIHBhZ2VzIGFuZAo+ID4gaW50ZXJlc3Rpbmds
eSBhIHdlYiBzZWFyY2ggZ2F2ZSBtZSBub3RoaW5nIGFib3V0IGl0LiBPciBpcyByZWlzZXJmc3R1
bmUKPiA+IG5vdCB0byBiZSB1c2VkIGZvciBhZGRpbmcgYmFkIGJsb2NrcyB0byB0aGUgZnM/Cj4g
Cj4gcmVpc2VyZnN0dW5lIGlzIHN1cHBvc2VkIHRvIGJlIHVzZSBmb3IgdGhhdC4gWW91IGVuY291
bnRlcmVkIHJlaXNlcmZzdHVuZSBidWcuCj4gV2UgYXJlIHdvcmtpbmcgb24gYSBmaXguCj4gCj4g
Cj4gCgotLSAKVml0YWx5Cg==

--Boundary-00=_4VQWD5VtM1F6KuO
Content-Type: text/x-diff;
  charset="windows-1251";
  name="reiserfsprogs-addbadblock-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="reiserfsprogs-addbadblock-fix.patch"

diff -rup ./reiserfsprogs-3.6.19/reiserfscore/reiserfslib.c ./reiserfsprogs-3.6.19-2/reiserfscore/reiserfslib.c
--- ./reiserfsprogs-3.6.19/reiserfscore/reiserfslib.c	2005-10-21 18:42:23.088825144 +0400
+++ ./reiserfsprogs-3.6.19-2/reiserfscore/reiserfslib.c	2005-10-21 19:01:46.558950800 +0400
@@ -1346,6 +1346,24 @@ void mark_badblock(reiserfs_filsys_t *fs
 	pathrelse (badblock_path);
 }
 
+static int reiserfs_alloc_blocks (reiserfs_filsys_t * fs,
+				  unsigned long *blknr,
+				  unsigned long start, 
+				  int count)
+{
+    int i;
+    
+    for (i = 0; i < count; i ++) {
+	blknr[i] = 0;
+	if (reiserfs_bitmap_find_zero_bit(fs->fs_bitmap2, blknr + i))
+	    die ("%s: failed to allocate a block.", __FUNCTION__);
+	
+	reiserfs_bitmap_set_bit(fs->fs_bitmap2, blknr[i]);
+    }
+    
+    return CARRY_ON;
+}
+
 void add_badblock_list (reiserfs_filsys_t * fs, int replace) {
     struct tree_balance tb;
     struct path badblock_path;
@@ -1372,7 +1390,8 @@ void add_badblock_list (reiserfs_filsys_
     set_type (KEY_FORMAT_2, &badblock_ih.ih_key, TYPE_INDIRECT);
 
     j = 0;
-
+    fs->block_allocator = reiserfs_alloc_blocks;
+    
     /* insert all badblock pointers */
     for (i = 0; i < fs->fs_badblocks_bm->bm_bit_size; i++) {
         int retval;

--Boundary-00=_4VQWD5VtM1F6KuO--
