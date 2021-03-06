-----------------------------------------------------------------------
-- HEIG-VD, Haute Ecole d'Ingenierie et de Gestion du canton de Vaud
-- Institut REDS, Reconfigurable & Embedded Digital Systems
--
-- Fichier      : add4_c_o.vhd
-- Description  : Additionneur 4 bits avec carry in,
--                carry out et overflow out
--
-- Auteur       : E. Messerli
-- Date         : 10.10.2014
-- Version      : 1.0
--
-- Utilise      : Exercice cours VHDL
--
--| Modifications |-----------------------------------------------------------
-- Ver   Auteur Date         Description
-- 2.0    EMI   03-03-2016   Version additionneur avec c_in, c_out et ovr_out
-- 2.1    PMR   17-10-2019   Résolution du laboratoire
--
------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity add4 is
  port (nbr_a_i   : in  std_logic_Vector(3 downto 0);
        nbr_b_i   : in  std_logic_Vector(3 downto 0);
        cin_i      : in  std_logic;
        somme_o    : out std_logic_Vector(3 downto 0);
        cout_o     : out std_Logic;
        ovr_o      : out std_logic  );
end add4;

architecture flot_don of add4 is

  -- signaux internes
  signal nbr_a_s, nbr_b_s : unsigned(4 downto 0);
  signal somme_s          : unsigned(4 downto 0);
  signal cin_s            : unsigned(4 downto 0);

  --component declaration

begin
  --Assignation des signaux
  cin_s   <= "0000" & cin_i;
  nbr_a_s <= '0' & unsigned(nbr_a_i);
  nbr_b_s <= '0' & unsigned(nbr_b_i);

  --Calul de la somme
  somme_s <= nbr_a_s + nbr_b_s + cin_s;

  -- Assignation des sorties
  somme_o <= std_logic_vector(somme_s(3 downto 0));
  cout_o <= somme_s(4);
end flot_don;
