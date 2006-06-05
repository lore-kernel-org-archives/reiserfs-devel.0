From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS slow, need help diagnosing
Date: Mon, 05 Jun 2006 09:20:39 -0700
Message-ID: <448459D7.70206@namesys.com>
References: <e61aht$7kf$1@sea.gmane.org>	 <1149516737.6402.120.camel@tribesman.namesys.com>	 <e61f4n$p6b$1@sea.gmane.org> <1149520582.6402.134.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1149520582.6402.134.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:

>
> As result one reiserfs block usually contains=20
>
fewer

>inodes than ext[23]
>inode block does.
>So, to stat each file of directory reiserfs has to perform more disk
>reads and to do more disk head seek than a filesystem which stores
>inodes compactly in preallocated disk area.=20
>
> =20
>
>>Thanks,
>>
>>  J=C3=BCrgen
>>
>>
>>   =20
>>
>
>
>
> =20
>

