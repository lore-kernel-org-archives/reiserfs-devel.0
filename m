From: Adrian Ulrich <reiser4@blinkenlights.ch>
Subject: Re: Why is Reiser4 slower then ReiserFS v3
Date: Tue, 28 Dec 2004 19:52:39 +0100
Message-ID: <20041228195239.3a1531d5.reiser4@blinkenlights.ch>
References: <231dafb5041227123867a2c873@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <231dafb5041227123867a2c873@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I also noticed some odd slowness of reiser4

(Running 2.6.10 using the latest 2.6.10-rcsomething reiser4 patch)


What i did:

 I created a small script wich creates MANY (= 195075) directories
 like this: 1/[1-3]/[1-255]/[1-255]

 After this, i ran 'sync && find . > /dev/null && rm -rf *'

 Well, it's not a good test, but compare the speed of 
 the 'find' and 'rm -rf' part beteween ReiserFS and Reiser4 :-/

reiser3

#./mkdirs.pl
real    5m21.194s
user    1m12.323s
sys     4m6.740s

#find . > /dev/null
real    0m6.419s
user    0m0.940s
sys     0m5.159s

#rm -rf *
real    0m24.357s
user    0m1.558s
sys     0m22.797s

reiser4

#./mkdirs.pl
real    6m21.996s
user    1m13.395s
sys     5m8.233s

#find . > /dev/null
real    0m16.006s
user    0m3.323s
sys     0m12.676s

#rm -rf *
real    5m58.963s  <-- OUCH!
user    0m7.962s
sys     5m50.870s

