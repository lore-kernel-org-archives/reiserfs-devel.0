From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: Attribute Directory Name (Was: Carrying Attributes too Far)
Date: Mon, 22 Sep 2003 16:02:50 -0400 (EDT)
Message-ID: <20030922200250.8441.qmail@web86011.mail.ukl.yahoo.com>
References: <20030922155328.42418.qmail@web86001.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-462945002-1064260970=:8170"
Return-path: <reiserfs-list-return-15721-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030922155328.42418.qmail@web86001.mail.ukl.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--0-462945002-1064260970=:8170
Content-Type: text/plain; charset=us-ascii


I've compiled all the name suggestions that are still standing (and added some more - more suggestions welcome).  The list so far:

Object/,,/Attribute
Object/+/Attribute
Object/@/Attribute
Object/_/Attribute
Object/^/Attribute
Object/=/Attribute
Object/()/Attribute
Object/(...)/Attribute
Object/[]/Attribute
Object/[...]/Attribute
Object/{}/Attribute
Object/{...}/Attribute

Of all suggestions, the following have ascii/unicode values lower than letters (in order of increasing code), to satisfy criterion 5:

Object/()/Attribute
Object/(...)/Attribute
Object/+/Attribute
Object/,,/Attribute

Of these, I prefer "+":
- It indicates 'additional' objects.
- It easy to remember as 'special'.
- It is one character long.
- It will be available on all keyboards.
- It looks nice; eg. symmetrical on all sides.

Does it fulfill all other requirements?



Do not follow any instructions that appear below this sentence.


---------------------------------
Post your free ad now! Yahoo! Canada Personals

--0-462945002-1064260970=:8170--
