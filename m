From: Domenico Andreoli <cavok@libero.it>
Subject: libaal & libreiser4 sonames
Date: Tue, 23 Dec 2003 13:08:07 +0100
Message-ID: <3FE83027.4090008@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16390-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

hi,

i just built libaal and libreiser4 from 2003.12.23 snapshot.

i see that now the sonames include the full version of the libraries, 
making their upgrade somewhat more tricky in package and distribution 
contexts.

which is the plan to manage changes of the library interfaces? you use 
both -version-info and -release libtool params, how do you update them?

actually this matter has little relevance but in future, when more 
software will use these libraries, you won't surely want to break anything 
only because you released a fix update and changed the version (and hence 
the soname) of the shared library, will you?

cheers
domenico

-----[ Domenico Andreoli, aka cavok
--[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

