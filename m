From: Sonny Rao <sonny@burdell.org>
Subject: Odd Block allocation behavior on Reiser3
Date: Mon, 9 Aug 2004 16:19:39 -0400
Message-ID: <20040809201939.GA55683@kevlar.burdell.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi, I'm investigating filesystem performance on sequential read
patterns of large files, and I discovered an odd pattern of block
allocation and subsequent re-allocation after overwrite under reiser3:

x44016way1:/mnt/tmp1 # dd if=/dev/zero of=filedh bs=1k count=$[ 512 * 1024 ]
524288+0 records in
524288+0 records out
x44016way1:/mnt/tmp1 # filefrag  *
filedh: 134 extents found
x44016way1:/mnt/tmp1 # dd if=/dev/zero of=filedh bs=1k count=$[ 512 * 1024 ]
524288+0 records in
524288+0 records out
x44016way1:/mnt/tmp1 # filefrag  *
filedh: 5 extents found
x44016way1:/mnt/tmp1 # dd if=/dev/zero of=filedh bs=1k count=$[ 512 * 1024 ]
524288+0 records in
524288+0 records out
x44016way1:/mnt/tmp1 # filefrag  *
filedh: 134 extents found
x44016way1:/mnt/tmp1 # dd if=/dev/zero of=filedh bs=1k count=$[ 512 * 1024 ]
524288+0 records in
524288+0 records out
x44016way1:/mnt/tmp1 # filefrag  *
filedh: 5 extents found

This was done on a newly created filesystem with plenty of available
space and no other files.  I tried this test several times and saw the
number of extents for the file vary from 5,6,7 and 134 extents, but it
is always different after each over-write.

First, I expect that an extent-based filesystem like reiserfs
would simply allocate one or just a few extents for this file rather
than the 134 extents I see.   XFS and JFS both will create files with
1 extent.  Even ext3, will create the 512MB file with just 5 extents.
134 extents on a brand new filesystem seems ridiculous to me.  

Second, I'm wondering why we see re-allocation going on when we
over-write the file?  The result of just 5 extents is good, but on a
second re-write we could get the 134 extents again or even a different
value.  I see that dd, opens the file with O_TRUNC, could that be
causing the differences? 

I've put the output of filefrag -v below for the 134 extent file.

Thanks,

Sonny Rao

filefrag -v filedh 
Checking filedh
Filesystem type is: 52654973
Filesystem cylinder groups is approximately 60672
Blocksize of file filedh is 4096
File size of filedh is 536870912 (131072 blocks)
Discontinuity: Block 956 is at 271842 (was 271839)
Discontinuity: Block 1976 is at 272863 (was 272861)
Discontinuity: Block 2979 is at 273867 (was 273865)
Discontinuity: Block 3999 is at 274888 (was 274886)
Discontinuity: Block 5019 is at 275909 (was 275907)
Discontinuity: Block 6022 is at 276913 (was 276911)
Discontinuity: Block 7042 is at 277934 (was 277932)
Discontinuity: Block 8045 is at 278938 (was 278936)
Discontinuity: Block 9065 is at 279959 (was 279957)
Discontinuity: Block 10068 is at 280963 (was 280961)
Discontinuity: Block 11088 is at 281984 (was 281982)
Discontinuity: Block 12091 is at 282988 (was 282986)
Discontinuity: Block 13111 is at 284009 (was 284007)
Discontinuity: Block 14114 is at 285013 (was 285011)
Discontinuity: Block 15134 is at 286034 (was 286032)
Discontinuity: Block 16137 is at 287038 (was 287036)
Discontinuity: Block 17157 is at 288059 (was 288057)
Discontinuity: Block 18160 is at 289063 (was 289061)
Discontinuity: Block 19180 is at 290084 (was 290082)
Discontinuity: Block 20183 is at 291088 (was 291086)
Discontinuity: Block 21203 is at 292109 (was 292107)
Discontinuity: Block 22223 is at 293130 (was 293128)
Discontinuity: Block 23226 is at 294134 (was 294132)
Discontinuity: Block 24004 is at 294913 (was 294911)
Discontinuity: Block 24242 is at 295152 (was 295150)
Discontinuity: Block 25245 is at 296156 (was 296154)
Discontinuity: Block 26265 is at 297177 (was 297175)
Discontinuity: Block 27268 is at 298181 (was 298179)
Discontinuity: Block 28288 is at 299202 (was 299200)
Discontinuity: Block 29291 is at 300206 (was 300204)
Discontinuity: Block 30311 is at 301227 (was 301225)
Discontinuity: Block 31331 is at 302248 (was 302246)
Discontinuity: Block 32334 is at 303252 (was 303250)
Discontinuity: Block 33354 is at 304273 (was 304271)
Discontinuity: Block 34357 is at 305277 (was 305275)
Discontinuity: Block 35377 is at 306298 (was 306296)
Discontinuity: Block 36380 is at 307302 (was 307300)
Discontinuity: Block 37400 is at 308323 (was 308321)
Discontinuity: Block 38403 is at 309327 (was 309325)
Discontinuity: Block 39423 is at 310348 (was 310346)
Discontinuity: Block 40426 is at 311352 (was 311350)
Discontinuity: Block 41446 is at 312373 (was 312371)
Discontinuity: Block 42449 is at 313377 (was 313375)
Discontinuity: Block 43469 is at 314398 (was 314396)
Discontinuity: Block 44472 is at 315402 (was 315400)
Discontinuity: Block 45492 is at 316423 (was 316421)
Discontinuity: Block 46495 is at 317427 (was 317425)
Discontinuity: Block 47513 is at 318446 (was 318444)
Discontinuity: Block 48533 is at 319467 (was 319465)
Discontinuity: Block 49536 is at 320471 (was 320469)
Discontinuity: Block 50556 is at 321492 (was 321490)
Discontinuity: Block 51559 is at 322496 (was 322494)
Discontinuity: Block 52579 is at 323517 (was 323515)
Discontinuity: Block 53582 is at 324521 (was 324519)
Discontinuity: Block 54602 is at 325542 (was 325540)
Discontinuity: Block 55605 is at 326546 (was 326544)
Discontinuity: Block 56625 is at 327567 (was 327565)
Discontinuity: Block 56738 is at 327681 (was 327679)
Discontinuity: Block 57639 is at 328583 (was 328581)
Discontinuity: Block 58642 is at 329587 (was 329585)
Discontinuity: Block 59662 is at 330608 (was 330606)
Discontinuity: Block 60665 is at 331612 (was 331610)
Discontinuity: Block 61685 is at 332633 (was 332631)
Discontinuity: Block 62688 is at 333637 (was 333635)
Discontinuity: Block 63708 is at 334658 (was 334656)
Discontinuity: Block 64711 is at 335662 (was 335660)
Discontinuity: Block 65731 is at 336683 (was 336681)
Discontinuity: Block 66751 is at 337704 (was 337702)
Discontinuity: Block 67754 is at 338708 (was 338706)
Discontinuity: Block 68774 is at 339729 (was 339727)
Discontinuity: Block 69777 is at 340733 (was 340731)
Discontinuity: Block 70797 is at 341754 (was 341752)
Discontinuity: Block 71800 is at 342758 (was 342756)
Discontinuity: Block 72820 is at 343779 (was 343777)
Discontinuity: Block 73823 is at 344783 (was 344781)
Discontinuity: Block 74843 is at 345804 (was 345802)
Discontinuity: Block 75846 is at 346808 (was 346806)
Discontinuity: Block 76866 is at 347829 (was 347827)
Discontinuity: Block 77869 is at 348833 (was 348831)
Discontinuity: Block 78889 is at 349854 (was 349852)
Discontinuity: Block 79892 is at 350858 (was 350856)
Discontinuity: Block 80912 is at 351879 (was 351877)
Discontinuity: Block 81915 is at 352883 (was 352881)
Discontinuity: Block 82935 is at 353904 (was 353902)
Discontinuity: Block 83955 is at 354925 (was 354923)
Discontinuity: Block 84958 is at 355929 (was 355927)
Discontinuity: Block 85978 is at 356950 (was 356948)
Discontinuity: Block 86981 is at 357954 (was 357952)
Discontinuity: Block 88001 is at 358975 (was 358973)
Discontinuity: Block 89004 is at 359979 (was 359977)
Discontinuity: Block 89473 is at 360449 (was 360447)
Discontinuity: Block 90017 is at 360994 (was 360992)
Discontinuity: Block 91037 is at 362015 (was 362013)
Discontinuity: Block 92040 is at 363019 (was 363017)
Discontinuity: Block 93060 is at 364040 (was 364038)
Discontinuity: Block 94063 is at 365044 (was 365042)
Discontinuity: Block 95083 is at 366065 (was 366063)
Discontinuity: Block 96086 is at 367069 (was 367067)
Discontinuity: Block 97106 is at 368090 (was 368088)
Discontinuity: Block 98109 is at 369094 (was 369092)
Discontinuity: Block 99129 is at 370115 (was 370113)
Discontinuity: Block 100132 is at 371119 (was 371117)
Discontinuity: Block 101152 is at 372140 (was 372138)
Discontinuity: Block 102155 is at 373144 (was 373142)
Discontinuity: Block 103175 is at 374165 (was 374163)
Discontinuity: Block 104195 is at 375186 (was 375184)
Discontinuity: Block 105198 is at 376190 (was 376188)
Discontinuity: Block 106218 is at 377211 (was 377209)
Discontinuity: Block 107221 is at 378215 (was 378213)
Discontinuity: Block 108241 is at 379236 (was 379234)
Discontinuity: Block 109244 is at 380240 (was 380238)
Discontinuity: Block 110264 is at 381261 (was 381259)
Discontinuity: Block 111267 is at 382265 (was 382263)
Discontinuity: Block 112287 is at 383286 (was 383284)
Discontinuity: Block 113290 is at 384290 (was 384288)
Discontinuity: Block 114310 is at 385311 (was 385309)
Discontinuity: Block 115313 is at 386315 (was 386313)
Discontinuity: Block 116333 is at 387336 (was 387334)
Discontinuity: Block 117336 is at 388340 (was 388338)
Discontinuity: Block 118356 is at 389361 (was 389359)
Discontinuity: Block 119359 is at 390365 (was 390363)
Discontinuity: Block 120379 is at 391386 (was 391384)
Discontinuity: Block 121399 is at 392407 (was 392405)
Discontinuity: Block 122208 is at 393217 (was 393215)
Discontinuity: Block 122395 is at 393405 (was 393403)
Discontinuity: Block 123415 is at 394426 (was 394424)
Discontinuity: Block 124435 is at 395447 (was 395445)
Discontinuity: Block 125438 is at 396451 (was 396449)
Discontinuity: Block 126458 is at 397472 (was 397470)
Discontinuity: Block 127461 is at 398476 (was 398474)
Discontinuity: Block 128481 is at 399497 (was 399495)
Discontinuity: Block 129484 is at 400501 (was 400499)
Discontinuity: Block 130500 is at 401518 (was 401516)
filedh: 134 extents found
