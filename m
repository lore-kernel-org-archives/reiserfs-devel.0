From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: resier4 performance with dbt-2
Date: Sat, 14 Feb 2004 01:41:17 +0100
Message-ID: <402D6EAD.20901@gmx.net>
References: <200402132351.i1DNpOE27923@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200402132351.i1DNpOE27923@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: markw@osdl.org
Cc: Dieter.Nuetzel@hamburg.de, reiserfs-list@namesys.com

markw@osdl.org wrote:
> On 14 Feb, Dieter N=FCtzel wrote:
>=20
>>Am Freitag, 13. Februar 2004 18:31 schrieb markw@osdl.org:
>>
>>>http://developer.osdl.org/markw/fs/dbt2_stp_results.html
>>>
>>>I have some data (at the link above) with the reiser4 2004.02.06
>>>snapshot applied to linux-2.6.2 with our DBT-2 (OLTP) workload on 4-wa=
y
>>>and 8-way systems.  On the 4-way systems, the results of the workload
>>>seem comparable to other filesystems.  On the 8-way systems, the resul=
ts
>>>of the workload drop about 28%.
>>>
>>>I have readprofile and oprofile (w/ annotated assembly) data with the
>>>results.  If there's anything else I can provide let me know.
>>
>>Where are the ReiserFS 3.xx plus data-logging results?
>>Several sites have them in production.
>=20
>=20
> Unfortunitely we've been running into linux kernel problems that we
> think is more of the fault of the aacraid driver on our systems than th=
e
> reiserfs 3.xx, so I don't have any results for that.  It's just odd tha=
t
> only reiserfs 3.xx triggers it.  I'll copy that here for reference:

I know several admins who will not use adaptec cards even if they receive=

death threats. Regardless how high/low the load is, the machines will
eventually lock up when using adaptec SCSI controllers. No idea whether i=
t
is the driver or the hardware, but replacing the controller with the same=

model didn't fix it while exchanging it against another brand always fixe=
d it.

Buggy hardware, buggy driver, I don't care. If it doesn't work out of the=

box, another manufacturer gets the money next time.


Carl-Daniel


