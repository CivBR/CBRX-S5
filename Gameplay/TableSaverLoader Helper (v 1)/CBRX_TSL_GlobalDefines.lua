--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
MapModData.CBRX					= MapModData.CBRX or {}
CBRX							= MapModData.CBRX

----------------
-- Gameplay mods
----------------
CBRX.JFD_RTP					= CBRX.JFD_RTP or {}
JFD_RTP							= CBRX.JFD_RTP

CBRX.JFD_RTP_Epithets			= CBRX.JFD_RTP_Epithets or {}
JFD_RTP_Epithets				= CBRX.JFD_RTP_Epithets

CBRX.JFD_RTP_Sovereignty		= CBRX.JFD_RTP_Sovereignty or {}
JFD_RTP_Sovereignty				= CBRX.JFD_RTP_Sovereignty

-------
-- Civs
-------
-- Cebu
CBRX.NC_Cebu	= CBRX.NC_Cebu or {}
NC_Cebu			= CBRX.NC_Cebu

NC_Cebu.BarangayPlots	= NC_Cebu.BarangayPlots or {}
BarangayPlots			= NC_Cebu.BarangayPlots

NC_Cebu.BarangayCities	= NC_Cebu.BarangayCities or {}
BarangayCities			= NC_Cebu.BarangayCities

NC_Cebu.OtherPlayersWithBarangays	= NC_Cebu.OtherPlayersWithBarangays or {}
OtherPlayersWithBarangays			= NC_Cebu.OtherPlayersWithBarangays

NC_Cebu.OtherCivBarangayCities	= NC_Cebu.OtherCivBarangayCities or {}
OtherCivBarangayCities			= NC_Cebu.OtherCivBarangayCities

-- Karankawa
CBRX.JWW_Karankawa = CBRX.JWW_Karankawa or {}
JWW_Karankawa = CBRX.JWW_Karankawa

JWW_Karankawa.DugoutPlots = JWW_Karankawa.DugoutPlots or {}
DugoutPlots = JWW_Karankawa.DugoutPlots

-- Kipchaks
CBRX.Lung_Kipchaks	= CBRX.Lung_Kipchaks or {}
Lung_Kipchaks		= CBRX.Lung_Kipchaks

Lung_Kipchaks.KipchakMercenaries	= Lung_Kipchaks.KipchakMercenaries or {}
KipchakMercenaries			= Lung_Kipchaks.KipchakMercenaries

Lung_Kipchaks.BalbalsPlots	= Lung_Kipchaks.BalbalsPlots or {}
BalbalsPlots			= Lung_Kipchaks.BalbalsPlots

Lung_Kipchaks.OtherPlayersWithBalbals	= Lung_Kipchaks.OtherPlayersWithBalbals or {}
OtherPlayersWithBalbals			= Lung_Kipchaks.OtherPlayersWithBalbals

Lung_Kipchaks.BalbalsHappiness	= Lung_Kipchaks.BalbalsHappiness or {}
BalbalsHappiness			= Lung_Kipchaks.BalbalsHappiness

-- Maravi
CBRX.JWW_Maravi = CBRX.JWW_Maravi or {}
JWW_Maravi = CBRX.JWW_Maravi

JWW_Maravi.NyauTracker = JWW_Maravi.NyauTracker or {}
tNyauTracker = JWW_Maravi.NyauTracker

-- Umhaill
CBRX.ASQ_Umhaill	= CBRX.ASQ_Umhaill or {}
ASQ_Umhaill			= CBRX.ASQ_Umhaill

ASQ_Umhaill.UmhaillCityAcquired	= ASQ_Umhaill.UmhaillCityAcquired or {}
UmhaillCityAcquired			= ASQ_Umhaill.UmhaillCityAcquired

-- Zazzau
CBRX.NC_Zazzau	= CBRX.NC_Zazzau or {}
NC_Zazzau		= CBRX.NC_Zazzau

NC_Zazzau.ZazzauOwnedLuxuries	= NC_Zazzau.ZazzauOwnedLuxuries or {}
ZazzauOwnedLuxuries			= NC_Zazzau.ZazzauOwnedLuxuries
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- CACHING
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
include("TableSaverLoader016.lua");

tableRoot = CBRX
tableName = "CBRX"

include("CBRX_TSL_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

print("LIME TESTING - Running OnModLoaded")

function OnModLoaded()
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

print("LIME TESTING - OnModLoaded has been run")
--==========================================================================================================================
--==========================================================================================================================
