From: Russell Coker <russell@coker.com.au>
Subject: performance improvements
Date: Mon, 23 Dec 2002 16:32:26 +0100
Message-ID: <200212231632.26686.russell@coker.com.au>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12217-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

One thing that could really improve system performance would be something like 
"nice" but for disk IO.

If you have a server that's using 90% of it's disk bandwidth with a large 
number of clients (EG a big mail server) then a simple "find /" is usually 
enough to give it a load average of 50+ and a delay of 1 second for every 
disk request (which makes operations such as POP mail checks excessively 
slow).

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

