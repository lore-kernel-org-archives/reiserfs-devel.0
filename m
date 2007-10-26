From: Dushan Tcholich <dusanc@gmail.com>
Subject: [PATCH 68/8] hash.c cleanup
Date: Fri, 26 Oct 2007 14:06:31 +0200
Message-ID: <1193400391.4615.24.camel@krshina3.gekom>
Reply-To: dusanc@gmail.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-v3PpV7z7q42fnrBlpt+R"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiser4 <reiserfs-devel@vger.kernel.org>, Edward Shishkin <edward@namesys.com>


--=-v3PpV7z7q42fnrBlpt+R
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

orig:	total: 12 errors, 1 warnings, 353 lines checked
patched:total: 0 errors, 1 warnings, 352 lines checked
leftover:

#268: FILE: hash.c:268:
+                       result =
aset_set_unsafe(&reiser4_inode_data(inode)->pset,




--=-v3PpV7z7q42fnrBlpt+R
Content-Disposition: attachment; filename=hash.c.patch
Content-Type: text/x-patch; name=hash.c.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Dushan Tcholich <dusanc@gmail.com>
--- hash.c.orig	2007-10-26 14:01:17.000000000 +0200
+++ hash.c	2007-10-26 14:04:35.000000000 +0200
@@ -13,7 +13,7 @@
 
 /* old rupasov (yura) hash */
 static __u64 hash_rupasov(const unsigned char *name /* name to hash */ ,
-			  int len /* @name's length */ )
+			  int len/* @name's length */)
 {
 	int i;
 	int j;
@@ -58,7 +58,7 @@ static __u64 hash_rupasov(const unsigned
 
 /* r5 hash */
 static __u64 hash_r5(const unsigned char *name /* name to hash */ ,
-		     int len UNUSED_ARG /* @name's length */ )
+		     int len UNUSED_ARG/* @name's length */)
 {
 	__u64 a = 0;
 
@@ -87,7 +87,7 @@ static __u64 hash_r5(const unsigned char
    This code was blindly upgraded to __u64 by s/__u32/__u64/g.
 */
 static __u64 hash_tea(const unsigned char *name /* name to hash */ ,
-		      int len /* @name's length */ )
+		      int len/* @name's length */)
 {
 	__u64 k[] = { 0x9464a485u, 0x542e1a94u, 0x3e846bffu, 0xb75bcfc3u };
 
@@ -113,16 +113,15 @@ static __u64 hash_tea(const unsigned cha
 		b0 = h0;						\
 		b1 = h1;						\
 									\
-		do							\
-		{							\
+		do {							\
 			sum += DELTA;					\
 			b0 += ((b1 << 4)+a) ^ (b1+sum) ^ ((b1 >> 5)+b);	\
 			b1 += ((b0 << 4)+c) ^ (b0+sum) ^ ((b0 >> 5)+d);	\
-		} while(--n);						\
+		} while (--n);						\
 									\
 		h0 += b0;						\
 		h1 += b1;						\
-	} while(0)
+	} while (0)
 
 	pad = (__u64) len | ((__u64) len << 8);
 	pad |= pad << 16;
@@ -144,7 +143,7 @@ static __u64 hash_tea(const unsigned cha
 	}
 
 	if (len >= 12) {
-		//assert(len < 16);
+		/* assert(len < 16); */
 		if (len >= 16)
 			*(int *)0 = 0;
 
@@ -161,7 +160,7 @@ static __u64 hash_tea(const unsigned cha
 			d |= name[i];
 		}
 	} else if (len >= 8) {
-		//assert(len < 12);
+		/* assert(len < 12); */
 		if (len >= 12)
 			*(int *)0 = 0;
 		a = (__u64) name[0] | (__u64) name[1] << 8 | (__u64) name[2] <<
@@ -175,7 +174,7 @@ static __u64 hash_tea(const unsigned cha
 			c |= name[i];
 		}
 	} else if (len >= 4) {
-		//assert(len < 8);
+		/* assert(len < 8); */
 		if (len >= 8)
 			*(int *)0 = 0;
 		a = (__u64) name[0] | (__u64) name[1] << 8 | (__u64) name[2] <<
@@ -187,7 +186,7 @@ static __u64 hash_tea(const unsigned cha
 			b |= name[i];
 		}
 	} else {
-		//assert(len < 4);
+		/* assert(len < 4); */
 		if (len >= 4)
 			*(int *)0 = 0;
 		a = b = c = d = pad;
@@ -220,7 +219,7 @@ static __u64 hash_tea(const unsigned cha
 
 */
 static __u64 hash_fnv1(const unsigned char *name /* name to hash */ ,
-		       int len UNUSED_ARG /* @name's length */ )
+		       int len UNUSED_ARG/* @name's length */)
 {
 	unsigned long long a = 0xcbf29ce484222325ull;
 	const unsigned long long fnv_64_prime = 0x100000001b3ull;
@@ -242,7 +241,7 @@ static __u64 hash_fnv1(const unsigned ch
 /* degenerate hash function used to simplify testing of non-unique key
    handling */
 static __u64 hash_deg(const unsigned char *name UNUSED_ARG /* name to hash */ ,
-		      int len UNUSED_ARG /* @name's length */ )
+		      int len UNUSED_ARG/* @name's length */)
 {
 	return 0xc0c0c0c010101010ull;
 }

--=-v3PpV7z7q42fnrBlpt+R--

