From: Norbert =?ISO-8859-1?Q?Gr=FCn?= <gnor-gpl@gmx.de>
Subject: Is a unified namespace desirable?
Date: Sat, 29 Mar 2003 14:33:04 +0100 (MET)
Message-ID: <5462.1048944784@www45.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13429-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-list@namesys.com

Dear Developers!

Having a unified namespace looks nice from a theoretical standpoint,
but I have some reservations about this.

The reason for these qualms is, who else, Bill Gates.

He "integrated" his MSIE in such a way into Windows, that Mr. Bad Guy
from Upper Beluchistan just needs a few lines of JavaScript to access
any function of any DLL found on the victim's PC. And he can edit the
Zones turning this shiny concept into an outright fraud.

Albeit XP takes efforts to lure you to Microsoft's servers every few
keystrokes, it still indicates these non-local resources as links.
Other third-party programs are less polite. I don't talk about the
ET-syndrome behind your back.

Not everybody has a flat rate and might be surprised by a =80600+ phone
bill because the machine was online for 1.45Ct/min 24/7 a whole month,
let alone those 0190- and 0900-diallers that make you surf at =801.86/min
or even more, giving a =8080,000+ bill and more.

So there is need for a media break when a resource presented is
non-local. Especially with malware-prone Windows, this WAN connector
should reside on a non-Windows machine, preferably with a non-x86 CPU.
Configuration of this machine should be with a built-in console, so
only a keyboard and LCD need be hooked up. Malware authors are still
quite clever.

This diald box will send a login challenge to the machine that wants to
go outdoors. All secrets will be kept on the diald box, the stub that
will present the login box to the user will wipe out any trace of the
credentials after use. Agreed, this login box is close to the
denial-of-service approach Billy uses to force you to allow everything
and blaming you for doing so by pretending your decision being totally
uninfluenced by him.

At best, any Windows machine should be thrown away, malware already
steals credentials there, it will void any effect of encryption via SSL
etc. by reading on the cleartext level when writing to the screen via
GDI or DirectX or stealing PGP keys when handed to the encryption
module. This are the bad sides of transparent modularity and
orthogonality via ActiveX or (D)COM(+) that are developed for mutual
trade secret protection. You can show clean source, compile it cleanly,
certify it, but malware doesn't need to be compiled in, it wedges
itself anywhere into any DLL call chain. *NIX modularity and
orthogonality is file-based, which is harder to crack. Also *NIX
programs are multi-user aware which is not true of all Windows
programs. So it is more likely to use *NIX as a humble user than
Windows where those single-user programs quickly force you to do
everything as administrator.

Albeit Konqueror happily lacks MSIE's barn doors, people are already
scared by the integration of file manager, e.g. shell and browser which
is also true for Nautilus and probably others.

So some care has to be taken not to get drunk with blurring any
boundary between LAN and WAN.

Billy already gave us the worst possible solution: clumsy drive letters
as CP/M legacy on one hand and shell access to Mr. Bad Guy on the other
hand. And TCPA will wrench the last means of defence out of your hands
and Billy still exempt from any liability. He won't pay your tax debt
when Mr. Bad Guy made a mess of your General Ledger so you can't tell
your assets from your liability.

Linux and the BSDs shouldn't go the same way. *NIX legacy is
professional networking (host and terminal are just stone age
networking) with recent development in additional lines of defence
against too powerful root, so hackers benefit less from getting the
janitors' master key. Fortunately *NIX can fence in programs that
potentially need a WAN connection.

Look at bugs.kde.org for the keywords "jekyll" and "hyde". This change
of personality is trivial with stand-alone WAN programs, just a shell
script that wraps a "su" for Mr. Hyde around the real program, and
slightly more complicated for Konqueror and Nautilus, where WAN
protocols will fork a second Mr. Hyde instance. The little
inconvenience of moving files to and from Mr. Hyde's lair as Dr. Jekyll
should be greatly compensated by the satisfaction that Mr. Bad Guy
can't get at your General Ledger.

Thus the unification of namespaces should not carried too far: They
should play to the same tune, but, as with current protocols and
URL/URN/URIs, it should be distinguishable whether these are WAN or LAN
resources. Caution has to be taken whether ZoneAlarm patents may be
infringed and if these can be voided. Lists of trustable IP addresses
are known as allow/deny lists of hosts that translate finally into IP
addresses via /etc/hosts, NIS/NIS+/NYS, DNS, LDAP and similar
translation services, so any patent of ZoneLabs in this direction
should be voided as trivial, straightforward and not new. They may have
their application lists patented, under *NIX this can be solved by the
methods mentioned in the paragraph before.

We can only hope Billys business concept and the US habit of
re-patenting the wheel three times a day will blow up. This is aiding
and abetting the installation of private taxes which is high treason at
least since the "Boston Tea Party", but also since the Foundation
Legend of the Brit Parliament where the Lords demanded comanagement of
the King's finances because they knew the ressources of their serfs
being limited.

These forces going bust will allow re-professionalisation of computers
and the return of the value of the licensees possessions which are
regarded nil today.

This re-professionalisation will make media breaks again an accepted
method of keeping awareness of risks instead of making anything appear
local and give write access to anybody anywhere but the real owner
where Billy wants us to go not only today but in eternity.

Kind regards

Norbert Gr=FCn (gnor@x-mail.net)


--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=E4cheln! Fotogalerie online mit GMX ohne eigene Homepage!

