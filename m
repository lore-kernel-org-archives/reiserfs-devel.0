From: Timothy Webster <tdwebste2@yahoo.com>
Subject: Re: Microsoft's Robert Scoble Discusses Search Engine Technology
Date: Mon, 9 Feb 2004 03:19:09 -0800 (PST)
Message-ID: <20040209111909.55415.qmail@web60306.mail.yahoo.com>
References: <402708DD.6030806@namesys.com>
Reply-To: tdwebste2@yahoo.com
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402708DD.6030806@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

This not such a strange concept in fact already exist
today. Most p2p networks use meta-data, to help
identify files and assisting searching, such as hash
and comments. I think p2p networks also help us to
identify some of the problems, mainly trust worthiness
 at the same time maintaining anonymity.

When a user names or comments or adds other meta-data
to a file. The user should sign that meta-data. This
certificate created by the user to sign should not
divulge the users identity.


Users or search engines can look up the certificates
"via CA" of the signed meta-data to see if they have
been revoked and to obtain the certificate holder's
current rating.

Search engines would of course be adding there own
meta-data in the same way users add meta-data.


Applications would be responsible for using the signed
meta-data. An application might work as follows.
Corrections made to the meta-data signed by certifiate
holder decrease the rating of that certificate holder.
References to meta-data and agreements would increase
the rating of that certificate holder.

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html
