From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: old block allocator found in 2.4.19
Date: Thu, 23 Jan 2003 23:30:07 +0100
Message-ID: <5.2.0.9.2.20030123232554.02004bd8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com

Hi Oleg, as you remember I mentioned you about my loop-aes+lvm+reiserfs 
problem, that leaves hung processes after them, and only a cold reboot 
could save a solution. well these problems came (in my opinion) after the 
introduction of the new block allocator in 2.4.20-preX. in the first 
version the new block allocation wasnt the default one, we had to use some 
preallocmin= etcetc flag in the mount process. well I would like to try 
with a new 2.4.20 kernel the settings for the old allocator. is there a way 
to use the old allocator with the new kernel? some mount option or any?
regards,
greg


