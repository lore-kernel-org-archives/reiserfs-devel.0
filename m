From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: journal size reiserfs vs reiser4
Date: Fri, 02 Sep 2005 19:37:40 +0200
Message-ID: <op.swhkk2nrd4os1z@localhost>
References: <20050901134604.31ddd297@SiRiUS.home> <20050901144842.34629bcf@SiRiUS.home> <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home> <4316FD28.5020304@redhat.com> <43171D57.3030007@namesys.com> <431726F2.1090508@redhat.com> <b14e81f005090119283406eafa@mail.gmail.com> <4317F28F.80704@namesys.com> <4317FD1B.504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4317FD1B.504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dnia Fri, 02 Sep 2005 09:19:55 +0200, Hans Reiser <reiser@namesys.com> napi=
sa=B3:

> It could probably be a lot less than 5%, 2% is more than enough I would
> guess, but we also need to reserve space to get good performance.
>

Maybe You can make it an mkfs.reiser4 option, set 5% to default so it won't=
 change anything to 99% of people using reiser4 but will make that 1% that =
want some other value happy.
