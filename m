From: "Lin Shen \(lshen\)" <lshen@cisco.com>
Subject: Why reiser does a disk write on every sync() call?
Date: Mon, 26 Mar 2007 11:12:25 -0700
Message-ID: <08A9A3213527A6428774900A80DBD8D803BB7CC3@xmb-sjc-222.amer.cisco.com>
References: <1174932216.16988.ezmlm@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
In-Reply-To: <1174932216.16988.ezmlm@namesys.com>
DKIM-Signature: v=0.5; a=rsa-sha256; q=dns/txt; l=261; t=1174932757; x=1175796757;
	c=relaxed/simple; s=sjdkim4002;
	h=Content-Type:From:Subject:Content-Transfer-Encoding:MIME-Version;
	d=cisco.com; i=lshen@cisco.com;
	z=From:=20=22Lin=20Shen=20\(lshen\)=22=20<lshen@cisco.com>
	|Subject:=20Why=20reiser=20does=20a=20disk=20write=20on=20every=20sync()=
	20call?
	|Sender:=20;
	bh=CjWxEp1Y3a9QHcnoqhktnFYs7Xb2nCDuTSeYfL1hlnI=;
	b=rULYUph+ptKHyLELtF20paEwKvBPjTIWqdXkmZs2stn0QAyiZIe5OuwHShaSXczyMRccpkgv
	+/O/INHOAzu6JzjLm1QUgCazMFzE7MJ/6Kr+FofDJdw5EuZvUfYsFqAS;
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm using iostat to measure disk reads/writes associated with various
file operations under Reiser. One thing I noticed and can't explain is
that every sync() call by itself (not following a write or anything)
will cause an I/O write. Any ideas?

Lin =20
