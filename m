From: =?ISO-8859-1?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: is quotacheck slow with reiserfs
Date: Thu, 05 Oct 2006 09:33:04 +0200
Message-ID: <4524B530.9060100@muenning.com>
References: <20061005203445.GA7650@apartia.fr> <200610060209.11952.vs@namesys.com> <20061006075016.GA2414@apartia.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-30013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061006075016.GA2414@apartia.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Louis-David Mitterrand wrote:
> On Fri, Oct 06, 2006 at 02:09:11AM +0400, Vladimir V. Saveliev wrote:
>> On Friday 06 October 2006 00:34, Louis-David Mitterrand wrote:
>>> On a 200-user mail server with a 500gb reiser3 fs, quotacheck takes an =

>>> hour at boot time. This is a mail server with 200 users.=20
>>>
>> which linux version is in use on the server?
>=20
> Debian unstable with latest kernel 2.6.17.
>=20
>>> Is that normal? Is there a way to speed it up?
>>>
>> How do users store their mails? If they store one mail in a separate=20
>> file, then quotacheck is to iterate over
>> a lot files which can be very time consuming.
>=20
> We use maildir, so, yes, it's a lot of files.
>=20
> Isn't there a way to run quotacheck in the background while daemons=20
> start serving users?=20
>=20
> Or must it absolutely be run at mount time to be effective?

You may run quotacheck at any time if you don't mind slightly incorrect
qotas as changes done on already checked files while qotacheck is
running wouldn't be noticed. You may skip quotacheck at startup at all -
if your server didn't crash quotas should stay in sync. So you could use
some off-peak time for quotacheck at runtime and do this once in a while.

--=20
Konstantin M=FCnning
