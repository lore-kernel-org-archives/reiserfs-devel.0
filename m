From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: reiser4 - Non-removable files in lost+found
Date: Fri, 15 Oct 2004 10:11:27 +0200
Message-ID: <416F862F.6010807@dermichi.com>
References: <40FC740900079C5C@mail13.jumpyint.it> <416F855C.8040204@dermichi.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060009090708060102020108"
Return-path: <reiserfs-list-return-22072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <416F855C.8040204@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------060009090708060102020108
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Michael Weissenbacher wrote:
>> rm /lost+found/lost_name_*
>>
>> gives:
>>
>> rm: cannot remove `/lost+found/lost_name_5447b:6b68746d6c6361:27e2e2r?\t
>>
>> v\310:H\327\377\257O\275\275: v\310:\200r?\t@\001\261:\200r?\t': No such
>> file or directory
> 
> had the same problem, it is related to fsck which computes hashes the 
> wrong way if filenames are too long (and/or contain non-ascii 
> characters). vladimir sent a patch to the mailing list that corrected 
> this bug for me. not sure if this is already available in the 
> pre-version of reiser4progs.
> 
> regards,
> michael
> 
here's the patch...

--------------060009090708060102020108
Content-Type: text/x-patch;
 name="r5_hash.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="r5_hash.c.diff"

--- reiser4progs-1.0.0/plugin/hash/r5_hash/r5_hash.c.orig	2004-08-31 18:48:01.749889832 +0400
+++ reiser4progs-1.0.0/plugin/hash/r5_hash/r5_hash.c	2004-08-31 18:46:08.864051088 +0400
@@ -9,10 +9,12 @@
 uint64_t r5_hash_build(char *name, uint32_t len) {
 	uint32_t i;
 	uint64_t a = 0;
+	unsigned char *uname;
 	
+	uname = (unsigned char *)name;
 	for (i = 0; i < len; i++) {
-		a += name[i] << 4;
-		a += name[i] >> 4;
+		a += uname[i] << 4;
+		a += uname[i] >> 4;
 		a *= 11;
 	}
     

--------------060009090708060102020108--
