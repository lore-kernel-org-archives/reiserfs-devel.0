From: Hans Reiser <reiser@namesys.com>
Subject: Re: somewhat OT query on journalling
Date: Fri, 21 Jul 2006 18:54:49 -0600
Message-ID: <44C17759.5080603@namesys.com>
References: <20060719152744.GA26155@tranquility.scriptkitchen.com> <44BE95F6.50004@namesys.com> <20060721124518.GA1977@tranquility.scriptkitchen.com> <44C122F1.7000109@slaphack.com> <20060721212611.GA13453@wintermute> <44C14CF2.4080401@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29124-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44C14CF2.4080401@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>
Cc: =?ISO-8859-1?Q?Andreas_Sch=E4fer?= <gentryx@gmx.de>, reiserfs-list@namesys.com

David Masover wrote:

> Andreas Sch=E4fer wrote:
>
>>> Don't get too excited -- the transactions probably aren't done yet.
>>> Without those, no filesystem that claims to journal data is really
>>> any better than a filesystem which only journals metadata.  Even
>>> once they are implemented (or even if they are already),
>>> applications have to support them directly.
>>
>>
>> Actually, I think transactions in a filesystem context are a bit
>> different from the transactions you know form databases. Generally
>
>
> Yes, generally speaking, you're entirely right.  But in the case of
> Reiser4, at least for a single file, you can perform a number of
> writes and declare them a single transaction.

If we finish that code you can.;-)  One of the problems that we need to
deal with is that we are shipping a product pared of all functionality
not essential so that we can get it out the door, and the website still
describes the whole vision.  We will do the whole vision, but first we
need to get some income flowing.

