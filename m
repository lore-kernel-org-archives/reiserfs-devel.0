From: Alejandro Sanchez Acosta <asanchez@gnome.org>
Subject: Some more basic questions.
Date: 10 Nov 2003 05:15:20 +0100
Message-ID: <1068437719.3362.24.camel@voyager>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16026-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

I don't understand so well how the dancing trees work. I've seen in the
documentation that are faster than B+ trees, but I don't understand the
reason. Somebody can explain me how does it work a dancing tree and
where does reiserfs use it?

Other thing that I don't understand is the cache design, where are used
caches in the filesystem? 

And why is better to use extents than BLOBs? A lot of databases use
BLOB's to storage the data and get good performance with.

What security features provide reiser4? I have seen that you can use
crypto support and crypto compressing, does it support other security
features? does it use the new CryptoAPI? 

And other thing, if I want to do a new plugin, what I have to do? Any
documentation related?

Thanks in advance.
-- 
Alejandro Sanchez Acosta <asanchez@gnome.org>

