From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
Subject: Minor note FYI
Date: Fri, 24 Jun 2005 15:38:01 +0400
Message-ID: <42BBF099.4010906@yandex.ru>
References: <1117392967.29669.ezmlm@namesys.com> <429A1742.8030504@mh.be> <200505292137.j4TLbarw017197@turing-police.cc.vt.edu>            <429AAFDC.4050208@mh.be> <200505300737.j4U7bDKj002829@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24547-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505300737.j4U7bDKj002829@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Hello,

Look at the create_child_common() function at fs/reiser4/plugin/dir/dir.c:

There are _7_ places with the code like this in it:

result = blah();
if (result) {
	warning();
         DQUOT_FREE_INODE(object);
         object->i_flags |= S_NOQUOTA;
         return result;
}

isn't it cuter to use the classical way:

result = blah();
if (result) {
	warning();
	goto error;
}

...

error:
         DQUOT_FREE_INODE(object);
         object->i_flags |= S_NOQUOTA;
         return result;

?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
