From: Ashay Humane <ashay.humane@gmail.com>
Subject: Fwd: Error in fs/reiser4/page_cache.c : PG_active not declared
Date: Sat, 24 Jul 2004 23:16:12 -0400
Message-ID: <158e29890407242016c70b3f2@mail.gmail.com>
References: <158e298904072418267b1c40d7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19792-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <158e298904072418267b1c40d7@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@namesys.com

Hi,
I got the vanilla 2.6.7 kernel .. patched it to 2.6.8-rc2 then patched
it to 2.6.8-rc2-love2.

After the love patch, I get an error when compiling the kernel:

Undeclared variable PG_active in fs/reiser4/page_cache.c  Line 891

There are variables named PG_active_mapped and PG_active_unmapped in other .c
and .h files. But no PG_active .

Dosent look too bad .. but what should be done ?

Thanks
Ashay

--
<HAND>



-- 
<HAND>
